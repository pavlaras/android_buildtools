#!/bin/bash
#################################################################
#
# wrapper to satisfy android builds with jenkins
#
#################################################################

echo "starting build wrapper $0 ..."
SRCPATH="$1"
RUNCMD="$2"

export CCACHE_DIR=/home/androidsource/jenkins/.ccache

echo -e "USE_CCACHE: $USE_CCACHE\nCCACHE_DIR: $CCACHE_DIR\nANDROID_JACK_VM_ARGS: $ANDROID_JACK_VM_ARGS\nSRCPATH: $SRCPATH\nRUNCMD: $RUNCMD"

f_help(){
  echo -e "\n\nUsage:\n $0 sources-path cmd-to-run\n"
}

[ -z "$RUNCMD" ] && echo "ERROR: uuhm.. missing RUNCMD! What should I do? smokin a pipe or what? try again! pfff.." && f_help && exit 3
[ ! -d "$SRCPATH" ] && echo "ERROR: missing source path or $SRCPATH does not exists!" && exit 3

cd $SRCPATH
source build/envsetup.sh
$RUNCMD

echo "build wrapper $0 finished..."
