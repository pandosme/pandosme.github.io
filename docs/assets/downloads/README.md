This folder is for downloadable ZIPs referenced by site pages.

Place a file named `annoying-birds.zip` here. The ZIP should contain the original README.md from:

/home/fred/ACAP/annoying-birds/README.md

Once the ZIP is added, the site link `/assets/downloads/annoying-birds.zip` (labelled "Download" on the page) will serve the file.

To create the ZIP locally (example):

```
cd /home/fred/ACAP/annoying-birds/
zip -r annoying-birds.zip README.md
mv annoying-birds.zip /path/to/repo/docs/assets/downloads/
```
