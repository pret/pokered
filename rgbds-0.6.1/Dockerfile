# This file is part of RGBDS.
#
# Copyright (c) 2018-2019, Phil Smith and RGBDS contributors.
#
# SPDX-License-Identifier: MIT
# docker build -t rgbds:vX.X.X-alpine
FROM alpine:latest
RUN apk add --update \
      build-base \
      bison \
      libpng-dev
COPY . /rgbds
WORKDIR /rgbds
RUN make Q='' all

FROM alpine:latest
RUN apk add --update \
      libpng
COPY --from=0 \
  /rgbds/rgbasm \
  /rgbds/rgbfix \
  /rgbds/rgblink \
  /rgbds/rgbgfx \
  /bin/
