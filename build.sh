#!/bin/bash
set -ux

#flatpak remote-add --from origin $RUNTIME_REMOTE
curl -kLs https://people.gnome.org/~alexl/keys/gnome-sdk.gpg -O gnome-sdk.gpg
flatpak remote-add --gpg-import=gnome-sdk.gpg origin $RUNTIME_REPO
flatpak -v --ostree-verbose install origin $RUNTIME_PLATFORM
flatpak -v --ostree-verbose install origin $RUNTIME_SDK

tree /build
cd /build

#rsync -r $RSYNC_REPO/* repo/
flatpak-builder --force-clean --ccache --require-changes --repo=repo --subject="Nightly build of ${APPID}, `date`" app flatpak.json
flatpak build-update-repo --prune --prune-depth=20 repo
#rsync -r repo/ $RSYNC_REPO/

