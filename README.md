# Beeper

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
