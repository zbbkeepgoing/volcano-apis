#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})/..
CODEGEN_PKG=${CODEGEN_PKG:-$(cd ${SCRIPT_ROOT}; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ${GOPATH}/src/k8s.io/code-generator)}

vendor/k8s.io/code-generator/generate-groups.sh all \
  github.com/volcano-sh/apis/pkg/client github.com/volcano-sh/apis/pkg/apis/batch \
  batch.volcano.sh:v1alpha1 \
  --go-header-file ${SCRIPT_ROOT}/hack/boilerplate.go.txt
vendor/k8s.io/code-generator/generate-groups.sh all \
  github.com/volcano-sh/apis/pkg/client github.com/volcano-sh/apis/pkg/apis/bus \
  bus.volcano.sh:v1alpha1 \
  --go-header-file ${SCRIPT_ROOT}/hack/boilerplate.go.txt
vendor/k8s.io/code-generator/generate-groups.sh all \
  github.com/volcano-sh/apis/pkg/client github.com/volcano-sh/apis/pkg/apis/scheduling \
  scheduling.volcano.sh:v1beta1 \
  --go-header-file ${SCRIPT_ROOT}/hack/boilerplate.go.txt