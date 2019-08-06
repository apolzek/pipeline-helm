FROM alpine:3.10

RUN apk add --no-cache libintl curl ca-certificates && \
    apk add --no-cache --virtual build_deps gettext && \
    cp /usr/bin/envsubst /usr/local/bin/ && \
    curl -L https://git.io/get_helm.sh | bash && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del build_deps curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /bin

CMD ["/bin/sh"]