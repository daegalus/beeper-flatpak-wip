# Beeper

**DISCLAIMER: This is a Work In Progress repo for what will eventually be submitted to Flathub.**

Things that need to be done first:

- Ideally permission from Beeper folks to do this, not required but always a good idea
- A way to know what the current version of beeper is (programmatically, be it scraping a page, or an API, or something).
- A hash of the AppImage provided with the download, so we can verify the image.
- Be able to pull a specific version of the AppImage, not just `latest` (can be worked around, but not ideal)
- Generic screenshots for Flathub

---

Flatpak wrapper around the official Beeper desktop application - https://beeper.com/download

## Wayland support

Beeper Wayland support is currently broken, as it crashes on boot.

Wayland support can be enabled by setting the environment variable `BEEPER_USE_WAYLAND=1` either using [Flatseal](https://flathub.org/apps/details/com.github.tchx84.Flatseal), or the command line, like so:

```sh
flatpak override --user --env=BEEPER_USE_WAYLAND=1 com.beeper.Beeper
```

Wayland support can also be temporarily enabled for a single run:

```sh
flatpak run --env=BEEPER_USE_WAYLAND=1 com.beeper.Beeper
```
