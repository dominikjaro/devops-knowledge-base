#!/bin/bash

command -v tar > /dev/null 2>&1
mkdir -p releases
mkdir -p build_workspace

if [ $? -eq 0 ] ; then
  echo "System Check: READY"
else
  echo "System Check: FAILED - tar is missing"
  exit 1
fi
sleep 2;

build_artifact () {
  read -p "Enter build version (e.g. 1.0.0): " build_version
  touch build_workspace/source_code.bin
  tar -czf "releases/app-release-${build_version}.tar.gz" build_workspace
  echo -e "Artifact built successfully -- see the below:\n "
  ls -t
}

deploy_artifact () {
  echo "Which version do you want to deploy?"
  ls -t releases/
  sleep 1 && echo -e "\n"
  read -p "Enter the version number: " deploy_version

  target_file=releases/app-release-${deploy_version}.tar.gz

  if [ -f "$target_file" ] ; then
    echo "Deploying app-release-${deploy_version}.tar.gz to Production..."
    mkdir -p /tmp/production_server
    mv "$target_file" /tmp/production_server/
  else
    echo "Error: Artifact not found. Did you run the Build stage first?"
    sleep 2
  fi
}

while true ; do
  clear
  echo "Choose from the following options:"
  echo "1: Code Linter"
  echo "2: Build Artifact"
  echo "3: Deploy Artifact"
  echo "4: Quit"

  read -sn1

  case "$REPLY" in
    1) echo "Running Linter .... PASS" && sleep 1;;
    2) build_artifact;;
    3) deploy_artifact;;
    4) exit 0;;
    *) echo "Selected not recognized, please choose again";;
  esac
  read -n1 -p "Press any key to continue"
done

