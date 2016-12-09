#!/bin/bash
set -ux

flatpak remote-add --from origin $RUNTIME_REMOTE
flatpak -v --ostree-verbose install origin $RUNTIME_PLATFORM
flatpak -v --ostree-verbose install origin $RUNTIME_SDK

git clone $SOURCE_GIT /build
cd /build
git checkout $SOURCE_BRANCH

rsync -r $RSYNC_REPO/* repo/
flatpak-builder --force-clean --ccache --require-changes --repo=repo --subject="Nightly build of ${APPID}, `date`" app $APPID.json
flatpak build-update-repo --prune --prune-depth=20 repo
rsync -r repo/ $RSYNC_REPO/

