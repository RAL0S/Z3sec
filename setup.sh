#!/usr/bin/env bash

set -e

show_usage() {
  echo "Usage: $(basename $0) takes exactly 1 argument (install | uninstall)"
}

if [ $# -ne 1 ]; then
  show_usage
  exit 1
fi

check_env() {
  if [[ -z "${RALPM_TMP_DIR}" ]]; then
    echo "RALPM_TMP_DIR is not set"
    exit 1
  elif [[ -z "${RALPM_PKG_INSTALL_DIR}" ]]; then
    echo "RALPM_PKG_INSTALL_DIR is not set"
    exit 1
  elif [[ -z "${RALPM_PKG_BIN_DIR}" ]]; then
    echo "RALPM_PKG_BIN_DIR is not set"
    exit 1
  fi
}

install() {
  # Clone the repository
  git clone https://github.com/RAL0S/Z3sec-code.git $RALPM_TMP_DIR/Z3sec

  # Install dependencies
  cd $RALPM_TMP_DIR/Z3sec
  sudo bash ./install_dependencies.sh
  
  # Run setup.py to install Z3sec
  sudo python setup.py install

  # Inform the user to add ZLL master key
  echo ""
  echo "Z3sec installation complete. Please add the leaked ZLL master key in ~/.config/z3sec/touchlink_crypt.ini."
  echo "This configuration file is created at the first run of Z3sec."
}

uninstall() {
  # Remove installation
  pip uninstall -y z3sec || echo "Z3sec not found in pip"

  # Remove cloned repository
  rm -rf $RALPM_TMP_DIR/Z3sec

  echo "Z3sec has been uninstalled."
}

run() {
  if [[ "$1" == "install" ]]; then 
    install
  elif [[ "$1" == "uninstall" ]]; then 
    uninstall
  else
    show_usage
  fi
}

check_env
run $1
