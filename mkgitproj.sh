#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "usage: $(basename $0) <project name>"
  exit 1
fi
PROJ_NAME="$1"
PROJ="$(basename $1 .git).git"

pushd ${HOME}
mkdir -p ${PROJ} && cd ${PROJ}
git init --bare
git config receive.denyCurrentBranch ignore
echo "Owner name for this repository followed by [ENTER]:"
read OWNER
echo "Repository description followed by [ENTER]:"
read DESC
echo "owner=${OWNER}" >> cgitrc
echo "readme=README.md" >> cgitrc
echo "desc=${DESC}" >> cgitrc

TMPDIR=$(mktemp -d)
[  $? -ne 0 ] && echo "error making tmpdir" && exit 1
pushd ${TMPDIR}
git clone ${HOME}/${PROJ} tmp
[ $? -ne 0 ] && echo "error cloning our new repo" && exit 1
pushd tmp
CNT=${#PROJ_NAME}
HEADSTR=$(printf '%*s' "$CNT" ' ' | tr ' ' "=")
echo "${PROJ_NAME}" >> README.md
echo "${HEADSTR}" >> README.md
git add README.md
git commit -m "initial commit."
git push origin master
[ $? -ne 0 ] && echo "error pushing our repo." && exit 1
popd
popd
echo "rm -rf ${TMPDIR}"
rm -Irf "${TMPDR}"
popd

IP=$(/sbin/ifconfig eth0 | grep "inet addr" | cut -d':' -f2 | cut -d' ' -f1)
echo "Tell the user to do the following"
echo "    cd <directory with existing project>"
echo "    git init"
echo "    git remote add origin git@${IP}:${PROJ}"
echo "    git pull origin master"
echo "    git add <stuff>"
echo "    git commit"
echo "    git push origin master"

