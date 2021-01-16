#! /bin/bash

# test if commit message is specified. exit if not.
if [ "$1" == "" ] ; then
    echo  warning. commit message missing.
    exit
fi 

echo removing current release
ls | grep -v release-hugo-vrk.sh | xargs rm -rf

echo getting last public hugo site release
cp -r ../../hugo\ builder/hugo-vrk/_data/public/* .

#echo workaroung: deleting files too big for github pages
#rm vidéos/Coueron-dans-mon-ile-remixe.mp4

# adding everything to github
git add .

# committing
git commit -a -m "$1"

# pushing as vrk
git push github-as-vrk:valerieetlesriverskids/hugo-vrk.git
