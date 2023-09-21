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

---

## How to get builds and info from ToDesktop for Beeper

Beeper uses a service that builds and hosts all their cross-platform builds called ToDesktop. Below is the info on how to get versions, hashes, and other information to construct the necessary information to create builds easily and safely.

ToDesktop offers 2 endpoints. `dl.todesktop.com` and `download.todesktop.com` depending on which is hit, the behavior is different. Also note that `dl.todesktop.com` is used as a CNAME target from `download.beeper.com` and should be used through that. Hitting `dl.todesktop.com` is a streamlined api that has minimal information. `download.todesktop.com` lets you get additional information and a more raw api output.

### Using `download.todesktop.com`

First, the id for Beepers downloads is `2003241lzgn20jd`. This is what identifies Beepers stuff from other users on the platform.

All the information about the downloads is listed under downloadable YAML files. The URL and its output at the time of this writing is below.

`https://download.todesktop.com/2003241lzgn20jd/latest-linux.yml`

```yaml
version: 3.77.21
files:
  - url: beeper-3.77.21.AppImage
    sha512: zQcKZWFxTbXBKhMGoeIix+IVqq3H+/QAUP3Htxv1MToetwTwuw7+zZIA/sHCyW4BClUD+KcdVOuQs5OF/8BhfQ==
    size: 197894942
    blockMapSize: 205618
  - url: beeper-3.77.21.deb
    sha512: gYhYKSflNEp9ECiLhd1iaTyRFc3eOsCE1bNTHusgKS/gjQTsJpBBxCHbqrqFg5xdW6P83i0/JjJnG/aaAjAu9w==
    size: 148968352
  - url: beeper-3.77.21.rpm
    sha512: UUgBGWNFXuH7YOepTLoMN0buZAQAG+TeA6A5sMcEpV/C8yRIpuMzfDRs0IigGQjhNOFrI06AXvcxRMQrCQnjGg==
    size: 148572956
path: beeper-3.77.21.AppImage
sha512: zQcKZWFxTbXBKhMGoeIix+IVqq3H+/QAUP3Htxv1MToetwTwuw7+zZIA/sHCyW4BClUD+KcdVOuQs5OF/8BhfQ==
releaseDate: '2023-09-19T19:21:07.576Z'
```

If you notice, we have the version, the urls for all the various platform files, hashes to verify the download and even file sizes. The `url` fields are relative. So to download the `AppImage` you need to hit the following url.

`https://download.todesktop.com/2003241lzgn20jd/beeper-3.77.21.AppImage`

This will download that version. You can then use the sha512 hash to verify it.

The YAML files also exist for Windows and Mac OS, called `latest.yml` and `latest-mac.yml` respectively.

This should give you just enough information to get the files you need and verify them.

### Using `download.beeper.com` (`dl.todesktop.com`)

Since `download.beeper.com` is just a direct CNAME to `dl.todesktop.com` without needing to know the ID from above, it is easier to just use `download.beeper.com`.

Reading through [this documentation](https://www.todesktop.com/docs/recipes/download-links-from-your-website) from the ToDesktop site, we can glean the URL formats we can use to do more things with the download url.

This is the default URL on the beeper website for linux: `https://download.beeper.com/linux/appImage/x64`

But reading the documentation above, we can format it as `https://download.beeper.com/versions/3.77.21/linux/appImage/x64` and get an exact version!

we also know there are deb and rpm files. so you can do `https://download.beeper.com/versions/3.77.21/linux/rpm` and get the latest RPM file.

This should be enough information for anyone to create automated download/packaging for Flatpak, Nix, or anything for Beeper. Along with how to maintain the version updates.
