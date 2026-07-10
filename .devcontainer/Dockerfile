FROM amazonlinux:2023.8.20250818.0

RUN dnf install -y dnf-plugins-core \
    && dnf config-manager --add-repo https://mise.jdx.dev/rpm/mise.repo

RUN dnf install -y --allowerasing \
        git \
        mise \
    && rm -rf /var/cache/dnf/* \
    && dnf clean all