FROM mcr.microsoft.com/devcontainers/cpp:1-ubuntu-20.04

# ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="none"

# # Optionally install the cmake for vcpkg
# COPY ./reinstall-cmake.sh /tmp/

# RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
#         chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
#     fi \
#     && rm -f /tmp/reinstall-cmake.sh

# [Optional] Uncomment this section to install additional vcpkg ports.
# RUN su vscode -c "${VCPKG_ROOT}/vcpkg install <your-port-name-here>"

# [Optional] Uncomment this section to install additional packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
    gcc-arm-none-eabi srecord gcc-mipsel-linux-gnu && \
    git config --global --add safe.directory /data
WORKDIR /data
ENTRYPOINT ["/bin/bash", "./make-k1c.sh"]