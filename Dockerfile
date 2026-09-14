# This repository holds Kustomize configuration, not application source, so the
# published image is the guestbook app rebuilt from a pinned base. The point of
# rebuilding here is provenance: each release carries this repository's commit
# SHA in org.opencontainers.image.revision, which is what the
# project-test/guestbook Warehouse's freightCreationCriteria matches against
# commitFrom('https://github.com/Cloud-Hacks/kargo-quick-temp').ID
ARG BASE_TAG=v0.0.8
FROM ghcr.io/afzal442/guestbook:${BASE_TAG}

ARG GIT_REVISION=unknown
ARG VERSION=unknown
ARG CREATED=unknown

# Set explicitly rather than inherited: labels propagate from the base image, so
# without these every build would report the base image's revision and build date.
LABEL org.opencontainers.image.title="Guestbook" \
      org.opencontainers.image.description="Guestbook demo application" \
      org.opencontainers.image.revision="${GIT_REVISION}" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.created="${CREATED}" \
      org.opencontainers.image.url="https://github.com/Cloud-Hacks/kargo-quick-temp" \
      org.opencontainers.image.source="https://github.com/Cloud-Hacks/kargo-quick-temp"
