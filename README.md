# dotfiles

All the dotfiles needed to make the world a better place. This also aims to setup the OS without using Ansible which is what [mac-box](https://github.com/benmatselby/mac-box) does.

## Installation

```shell
git clone https://github.com/benmatselby/dotfiles.git
./install.sh
```

## Configuration

- `BMS_MACHINE_TYPE`: Can be `work`, `personal` and will (Dis)enables to be installed.

## Themes

You can set themes by running:

```shell
./themes/set.sh [theme]
```

Themes you can choose from:

- `catppuccin`
- `nord`
- `rose-pine`
- `tokyo-night`

This was ported from [Omakub](https://github.com/basecamp/omakub).
