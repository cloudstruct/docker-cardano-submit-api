FROM ubuntu:20.04 AS base

FROM base AS builder
RUN apt-get update && apt-get install -y unzip curl
# This only works on ARM. Deal with it.
RUN curl -sSL 'https://github.com/armada-alliance/cardano-node-binaries/blob/main/static-binaries/1_33_1.zip?raw=true' > 1_33_1.zip
RUN unzip -o 1_33_1.zip

FROM base AS prod
COPY --from=builder /cardano-node/cardano-submit-api /usr/local/bin/cardano-submit-api
ENTRYPOINT ["cardano-submit-api"]
