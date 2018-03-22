FROM alpine:latest
ENV TERRAGRUNT_VERSION=0.14.3
ADD https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 terragrunt
RUN chmod +x terragrunt

FROM hashicorp/terraform:light
MAINTAINER "pixelart Operations <operations@pixelart.at>"
COPY --from=0 terragrunt /usr/local/bin/
ENTRYPOINT ["/bin/sh"]
