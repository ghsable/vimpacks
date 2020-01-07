#!/bin/bash

# Vimpacks is Vim7later plugin management support tool.

# Copyright© 2019 @suna All Rights Reserved.
# https://ghsable.github.io/

# ------
# GLOBAL VARIABLE
readonly VIM_START_DIR=~/.vim/pack/mypackage/start

# INITIALIZE
[ -d ${VIM_START_DIR} ] || mkdir -pv ${VIM_START_DIR} >/dev/null
# ------

# USAGE
function usage() {
cat<< _EOT_
DESCRIPTION:
  This bash script is a simple plugin manager for Vim.

USAGE:
  ${0} idempotency : Idempotency
  ${0} update      : Update
  ${0} *           : Usage

CHECK:
  ls -l ${VIM_START_DIR}

_EOT_
exit 1
}

case ${1} in
  idempotency)
    # set variable
    readonly WORKSPACE_DIR=/tmp/vimpacks
    # make directory workspace
    [ -d ${WORKSPACE_DIR}/master ] || mkdir -pv ${WORKSPACE_DIR}/master >/dev/null
    # ------
    # make file start_dir/master
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/vimpacks.txt)
    do
      # start_dir/master[1/1]
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 5-5 | rev | cut -c 5- | rev`

      # start_dir[1/2] - INSTALL
      git clone --depth=1 --recursive ${GITREPOSITORY_URL} ${VIM_START_DIR}/${GITCLONEDIR_NAME} 2>/dev/null
      if [ "${?}" = "0" ]; then
        echo "-> (1/1) ${GITCLONEDIR_NAME}"
      else
        echo "INSTALLED : ${GITCLONEDIR_NAME}"
      fi

      # master[1/2]
      mkdir -pv ${WORKSPACE_DIR}/master/${GITCLONEDIR_NAME} >/dev/null
    done
    # start_dir[2/2]
    ls ${VIM_START_DIR} >${WORKSPACE_DIR}/vim_start_dir.txt
    # mastar[2/2]
    ls ${WORKSPACE_DIR}/master >${WORKSPACE_DIR}/master.txt
    # ------
    # ------
    # make file uninstall-list
    diff ${WORKSPACE_DIR}/vim_start_dir.txt ${WORKSPACE_DIR}/master.txt | grep -e "<" | cut -c 3- >${WORKSPACE_DIR}/uninstall_list.txt
    # uninstall
    cd ${VIM_START_DIR}
    echo "-- UNINSTALL -------------------"
    rm -rf $(cat ${WORKSPACE_DIR}/uninstall_list.txt)
    cat ${WORKSPACE_DIR}/uninstall_list.txt
    echo "----------------- UNINSTALED -->"
    # ------
    # clean
    rm -rf ${WORKSPACE_DIR}
    ;;
  update)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/vimpacks.txt)
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
