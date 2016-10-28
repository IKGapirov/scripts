#!/usr/bin/env bash

function usage()
{
echo -e "Usage:"
echo -e "";
echo -e "$0 <bullhead|falcon|kenzo>"
echo -e "";
exit 1;
}

if [ ! $1 ];
then
usage;
fi
case "$1" in
bullhead|falcon|kenzo)
cd $KERNELDIR/$1
;;
*)
usage;
esac

git reset --hard origin/nougat && git checkout nougat
mergeremote=$(cat upstream | awk '{print $1}')
mergebranch=$(cat upstream | awk '{print $2}')
git fetch $mergeremote $mergebranch
git merge $mergeremote/$mergebranch -S
