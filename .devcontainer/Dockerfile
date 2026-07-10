FROM amazonlinux:2023.8.20250818.0

RUN dnf install -y --allowerasing \
        git \
        make \
    && rm -rf /var/cache/dnf/* \
    && dnf clean all