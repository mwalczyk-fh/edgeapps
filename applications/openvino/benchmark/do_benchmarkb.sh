#!/bin/bash

# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2020 Intel Corporation

# shellcheck disable=SC1091
source /opt/intel/openvino_2021/bin/setupvars.sh
cd /opt/intel/openvino_2021/deployment_tools/demo || exit
./demo_squeezenet_download_convert_run.sh -d "${TARGET_DEVICE}"

/root/inference_engine_samples_build/intel64/Release/benchmark_app -i "${IMAGE}" -m "${MODEL}" -d "${TARGET_DEVICE}" -nireq "${NIREQ}" -api "${API}" -b "${BATCH_SIZE}"

