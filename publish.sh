#!/bin/bash

## Script modified from https://github.com/cboettig/labnotebook/blob/master/publish.sh 

# # check if any .Rmd files in _posts. if yes, knit to .md
# cd _posts
# if [[ -n `ls | grep Rmd$` ]]	# 
# then
#     # convert all Rmarkdown (Rmd) posts to md
#     for f in ./*.Rmd
#     do 
#         echo "Processing $f to md"
#         knit -n $f # Rmd to md only, no html generated
#         mv $f _Rmd_cache/. # move Rmd file so only md file is used by jekyll. Rmd_cache should be 
#                       # excluded in _config.yml
#         echo "Moved $f to Rmd_cache"
#     done
# fi

#cd .. # back to root directory

## Compile the site
jekyll build

## Copy site to repository for github hosting
git add -A
git commit -m "update site $(date +"%x %r")"
git pull rstat.consulting master
git push rstat.consulting master
echo "Site updated $(date +"%x %r") on Github server"

## Send site to Amazon S3 for web hosting
<<<<<<< HEAD
## s3cmd sync --delete-removed _site/ s3://jamaas.com
s3cmd sync _site/ --preserve s3://rstat.consulting
=======
## s3cmd sync --delete-removed _site/ s3://rstat.consulting
s3cmd put -r  _site/ s3://rstat.consulting
>>>>>>> 7b6419e0f737a055a75fb7051b16794d02febda5
echo "Site updated $(date +"%x %r") on Amazon S3"

