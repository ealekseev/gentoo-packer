#!/bin/bash

test -z "${IMAGE_FORMAT}" && echo "IMAGE_FORMAT env variable is not set" && exit 1
test -z "${MANIFEST}" && echo "MANIFEST env variable is not set" && exit 1

if test -f ${MANIFEST}; then
  export IMAGE=$(jq ".builds[0].files[0].name" ${MANIFEST} | sed 's/"//g')
  if test -z "${OUTPUT_NAME}"; then
    export OUTPUT_NAME=${IMAGE}.${IMAGE_FORMAT}
  else
    export OUTPUT_NAME=`dirname ${IMAGE}`/${OUTPUT_NAME}
  fi
  qemu-img convert -O ${IMAGE_FORMAT} ${IMAGE} ${OUTPUT_NAME}
  rm -f ${IMAGE}
fi
