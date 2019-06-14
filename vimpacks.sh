#!/bin/bash

# Vimpacks is a simple Vim plugin manager.

# Copyright© 2019 @suna All Rights Reserved.
# https://ghsable.github.io/


# GLOBAL VARIABLE
readonly VIM_START_DIR=~/.vim/pack/mypackage/start
readonly VIM_OPT_DIR=~/.vim/pack/mypackage/opt

# INITIALIZE
[ -d ${VIM_START_DIR} ] || mkdir -pv ${VIM_START_DIR}
[ -d ${VIM_OPT_DIR}   ] || mkdir -pv ${VIM_OPT_DIR}

# USAGE
function usage() {
cat<< _EOT_
DESCRIPTION:
  This bash script is a simple plugin manager for Vim.

USAGE:
  ${0} install : Install plugins
  ${0} update  : Update  plugins
  ${0} *       : Usage

CHECK:
  ls -l ${VIM_START_DIR}
  ls -l ${VIM_OPT_DIR}

_EOT_
exit 1
}

case ${1} in
  install)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/vimpacks.txt)
    do
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 5-5 | rev | cut -c 5- | rev`
      git clone --depth=1 --recursive ${GITREPOSITORY_URL} ${VIM_START_DIR}/${GITCLONEDIR_NAME} 2>/dev/null
      if [ "${?}" = "0" ]; then
        echo "-> (1/1) ${GITCLONEDIR_NAME}"
      else
        echo "INSTALLED : ${GITCLONEDIR_NAME}"
      fi
    done
    ;;
  update)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/install.txt)
    do
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 5-5 | rev | cut -c 5- | rev`
      if [ -d ${VIM_START_DIR}/${GITCLONEDIR_NAME} ]; then
        cd ${VIM_START_DIR}/${GITCLONEDIR_NAME}
        GITPULL_STDOUT=`git pull`
        if [ "${GITPULL_STDOUT}" != "Already up to date." ]; then
          git submodule foreach git pull
          echo "-> (1/1) ${GITCLONEDIR_NAME}"
          cd ${VIM_START_DIR}
        else
          echo "UPDATED : ${GITCLONEDIR_NAME}"
          cd ${VIM_START_DIR}
        fi 
      else
        echo "PLEASE INSTALL : ${GITCLONEDIR_NAME}"
      fi
    done
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
