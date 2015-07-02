#!/bin/bash

## Script modified from
## https://github.com/cboettig/labnotebook/blob/master/publish.sh by JAM on
## 2/7/2015

## Compile the site
jekyll build

## Copy site to repository for github hosting
git add -A
git commit -m "update site $(date +"%x %r")"
git pull rstat.consulting master
git push rstat.consulting master
echo "Site updated $(date +"%x %r") on Github server"

## Send site to Amazon S3 for web hosting
s3cmd sync --delete-removed _site/ s3://rstat.consulting
echo "Site updated $(date +"%x %r") on Amazon S3"

