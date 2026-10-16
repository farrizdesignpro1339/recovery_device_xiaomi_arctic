# TWRP Device Tree for REDMI A7 Pro / POCO C81 / POCO C81 Pro

This repository contains the TWRP device tree for the following devices:

- **REDMI A7 Pro**
- **POCO C81**
- **POCO C81 Pro**

## Device Information

| Feature | Specification |
|---|---|
| Device codename | `arctic` |
| Platform | Unisoc T7250 |
| Recovery | Team Win Recovery Project (TWRP) |
| Target Android version | Android 16 |

## Features

Works:

- [X] ADB
- [X] Display
- [X] Fastbootd
- [X] Flashing
- [X] MTP
- [X] Sideload
- [X] USB OTG
- [X] Touchscreen

### Not Working / To Do

- **Decryption of encrypted `/data`** — not supported yet; under development.

## Testing

Test the recovery on a compatible device and verify basic functions before relying on it for maintenance tasks. Booting successfully does not guarantee that every feature works on every supported variant.

## Disclaimer

This project is provided for development and testing purposes. Flashing recovery images or modifying device partitions can cause data loss or prevent the device from booting. Keep a backup of important data and verify the exact device variant before flashing.

## Credits

- [Team Win Recovery Project](https://twrp.me/)
- Android Open Source Project
- Contributors to the device tree and related open-source projects
- [rtyutechstudio](https://github.com/rtyutechstudio) for patch drm
