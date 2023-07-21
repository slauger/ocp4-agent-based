FROM registry.access.redhat.com/ubi8/ubi

ARG OPENSHIFT_VERSION="stable-4.12"
ENV OPENSHIFT_VERSION="${OPENSHIFT_VERSION}"

RUN curl -fsL -o openshift-client-linux.tar.gz "https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/${OPENSHIFT_VERSION}/openshift-client-linux.tar.gz" && \
    tar xzf openshift-client-linux.tar.gz oc && \
    mv oc /usr/local/bin/oc

RUN curl -fsL -o openshift-install-linux.tar.gz "https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/${OPENSHIFT_VERSION}/openshift-install-linux.tar.gz" && \
    tar xzf openshift-install-linux.tar.gz openshift-install && \
    mv openshift-install /usr/local/bin/openshift-install && \
    rm openshift-install-linux.tar.gz

RUN dnf copr enable nmstate/nmstate-git -y && \
    dnf install nmstate -y
