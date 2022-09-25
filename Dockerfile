FROM ubuntu:jammy AS tools

ENV BUILD_DIR /build

ENV RGBDS_DIR ${BUILD_DIR}/rgbds
ENV RGBDS_VER v0.5.2

ENV POKE_DIR ${BUILD_DIR}/pokered
ENV ROM_FILENAME=pokered.gbc

# get required build tools
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        git \
        libpng-tools \
        libpng-dev \
        # rgbds tools
        bison \
        libbison-dev \
        cmake

# build & install rgbds from src
RUN mkdir -p ${RGBDS_DIR} && \
    cd ${RGBDS_DIR} && \
    git clone https://github.com/gbdev/rgbds . && \
    git checkout ${RGBDS_VER} && \
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build && \
    cmake --install build
RUN rm -rf ${RGBDS_DIR}

# build the gb rom from current src
FROM tools AS build

RUN mkdir -p ${POKE_DIR}
COPY . ${POKE_DIR}

RUN cd ${POKE_DIR} && make

# copy the gb rom (so buildx can output it)
#   example command: docker build --target output --output . .
FROM build AS output

COPY --from=build ${POKE_DIR}/${ROM_FILENAME} ${BUILD_DIR}
