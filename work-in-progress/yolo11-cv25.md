***

## Executive Summary

This documentation describes running **YOLOv8/11** models on **CV25 devices** using the Ambarella toolchain to create a sample ACAP application. The workflow:
- Generate **ONNX models** with Ultralytics tools.
- Convert ONNX to CV25’s **CVFlow-compatible format**.
- Use **OpenCV** for image preprocessing (letterbox) and postprocessing (parsing, NMS) to ease ACAP implementation.

***

## Quick Start

### Obtain Sample Files

1. Download and extract [the sample archive file](https://axis365-my.sharepoint.com/:u:/g/personal/makotot_axis_com/EZG_y_cCvklEn03oILX7hj0BJH8Crnkc_lCTijKVEsCarg?e=nmwa06).

### Build the ACAP Application

```bash
docker build --tag yolo .
docker cp $(docker create yolo):/opt/app ./build
# Locate the application .eap file:
ls build/object_detection_yolo_VERSION.eap
```

### Install & Run

- Install and run the app via the camera’s web GUI.

***

## Prepare the Ambarella Toolchain

### Download

- Get the toolchain from the [tensorflow-to-larod-cv25 repo](https://github.com/AxisCommunications/acap-native-sdk-examples/tree/main/tensorflow-to-larod-cv25).  
- This guide uses **version 2.5.6**.

### Build the Toolchain Container (Apple Silicon Mac)

```bash
# Refer to toolchain's readme.txt for details.
docker buildx build --platform linux/amd64 -t cv_tool_cpu . -f ./Docker_Files/Dockerfile_CNNGen_basic.2.5.6.0.1245_ubu2004_CPU

docker run -it --name cvdev cv_tool_cpu bash
# Inside the container, you can add this to .bashrc:
source /usr/local/amba-cv-tools-basic.2.5.6.0.1245.ubuntu-20.04/env/cv25.env
```

***

## Convert YOLOv8/11s Model for CV25

### Export ONNX Model (Google Colab Example)

```python
%pip install ultralytics
import ultralytics
ultralytics.checks()

from ultralytics import YOLO
model = YOLO('yolov8s.pt')  # or YOLO('yolo11s.pt')
results = model.export(format='onnx', opset=16)
# Output: yolov8s.onnx
```

### Prepare Images and Conversion

- Copy ONNX file and ~8 images into `/home/docker` and `/home/docker/pics`.

#### Run Commands

```bash
gen_image_list.py -f pics -o dra_image_bin/img_list.txt -ns -e jpg -c 0 -d uint8 -r 640,640 -bf dra_image_bin -bo dra_image_bin/dra_bin_list.txt

onnxparser.py -m yolov8s.onnx -isrc "is:1,3,640,640|iq|idf:0,0,0,0|ic:255.00446258|i:images=./dra_image_bin/dra_bin_list.txt" -o onnx_yolov8s -of onnx_yolov8s/out_onnx_yolov8s_parser -odst "o:output0|odf:fp32" -c act-force-fx16,coeff-force-fx16

cd onnx_yolov8s
vas -auto -show-progress out_onnx_yolov8s_parser/onnx_yolov8s.vas

cavalry_gen -d vas_output -f onnx_yolov8s_cavalry.bin
```

***

## Run the Model in a Sample App

- Code combines refactored versions of:
    - [Axis Yolov5 sample](https://github.com/AxisCommunications/acap-native-sdk-examples/tree/main/object-detection-yolov5)
    - [Ultralytics YOLOv8/YOLOv5 C++ Inference with OpenCV DNN](https://github.com/ultralytics/ultralytics/tree/main/examples/YOLOv8-CPP-Inference)

**OpenCV** is used for letterbox preprocessing and NMS postprocessing.

**Model Input/Output**:
- Input: NCHW 640x640 uint8 tensor
- Output: (1, 84, 8400) fp32 tensor
    - `[0:4]`: bounding box center (x,y), width, height
    - `[4:84]`: scores for 80 COCO classes
    - 8400: Number of detections

Bounding boxes can be drawn, but labeling is only available via logs due to lack of AxOverlay support.

***

## Build the Sample ACAP

```bash
docker build --tag yolo .
docker cp $(docker create yolo):/opt/app ./build
```

***

## (Optional) Run tflite Model on ARTPEC9

- NOTE: Only CPU is supported for YOLOv8 on ARTPEC9 (not DLPU).

```python
from ultralytics import YOLO
model = YOLO('yolov8s.pt')
results = model.export(format='tflite', int8=True)
# Output: yolov8s_full_integer_quant.tflite
```

### Quantization Parameters

```python
import tensorflow as tf
model_path = 'yolov8s_saved_model/yolov8s_full_integer_quant.tflite'
interpreter = tf.lite.Interpreter(model_path)
interpreter.allocate_tensors()
output_details = interpreter.get_output_details()
input_details = interpreter.get_input_details()

scale, zero_point = output_details[0]['quantization']
print(f'out scale: {scale}, out zero point: {zero_point}')
scale, zero_point = input_details[0]['quantization']
print(f'in scale: {scale}, in zero point: {zero_point}')
```

### Build ACAP for ARTPEC9

```bash
docker build --tag yolo --build-arg MODEL=yolov8s_full_integer_quant.tflite .
docker cp $(docker create yolo):/opt/app ./build
```

Set model file = yolov8_full_integer_quant.tflite  
Set SoC name = armnn-cpu-tflite

***

## (Optional) Using Ambarella Tool 2.4.6

### Run x86_64 Ubuntu Image on Apple Silicon

```bash
docker run -it --platform linux/x86_64 --name ambcv ubuntu:18.04

# Or
docker buildx build --platform linux/amd64 .
```

### Example Dockerfile

<details>
<summary>Click to expand</summary>

```dockerfile
FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y && apt-get install -y sudo
RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Tokyo apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

ARG USERNAME=perry
ARG GROUPNAME=dev
ARG UID=1000
ARG GID=1000
ARG PASSWORD=perry
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME
WORKDIR /home/$USERNAME/

RUN sudo apt-get install -y neovim python3 python3-pip \
    libtiff5-dev libjpeg8-dev libopenjp2-7-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev \
    python3-tk libharfbuzz-dev libfribidi-dev libxcb1-dev    

RUN sudo apt-get clean

COPY ./Ubuntu-18.04/ /home/$USERNAME/
COPY ./inputs.txt /home/$USERNAME/

RUN ./ubuntuToolChain-basic.2.4.2.11.1099.ubuntu-18.04 < ./inputs.txt

CMD ["/bin/bash", "-c", "source /opt/amba-cv-tools-basic.2.4.2.11.1099.ubuntu-18.04/env/cv25.env"]
```

</details>

***

## (Optional) YOLOv5s Export

### Export YOLOv5s to ONNX (Google Colab)

```bash
!git clone https://github.com/ultralytics/yolov5
%cd yolov5
%pip install -qr requirements.txt comet_ml

import torch
import utils
display = utils.notebook_init()
!python export.py --weights yolov5s.pt --include onnx
```

### Prepare Images

```bash
mkdir pics
# Place jpeg images into pics
mkdir dra_image_bin
gen_image_list.py -f pics -o dra_image_bin/img_list.txt -ns -e jpg -c 0 -d 0,0 -r 640,640 -bf dra_image_bin -bo dra_image_bin/dra_bin_list.txt

onnxparser.py -m yolov5s.onnx -isrc "is:1,3,640,640|iq|idf:0,0,8,0|i:images=./dra_image_bin/dra_bin_list.txt" -o onnx_yolov5s -of onnx_yolov5s/out_onnx_yolov5s_parser -odst "o:output0|odf:fp32"

cd onnx_yolov5s
vas -auto -show-progress out_onnx_yolov5s_parser/onnx_yolov5s.vas

cavalry_gen -d vas_output -f onnx_yolov5s_op17_cavalry.bin
```

***

## Comments & Questions

- Not working with **M308** cameras—works with **M1075** and **M42**.
