# dotfiles

All the dotfiles needed to make the world a better place. This also aims to setup the OS without using Ansible which is what [mac-box](https://github.com/benmatselby/mac-box) does.

## Installation

```shell
git clone https://github.com/benmatselby/dotfiles.git
./install.sh
```

## Configuration

- `BMS_MACHINE_TYPE`: Can be `work`, `personal` and will (Dis)enables to be installed.
- `tmux` themes go in `~/.config/tmux/themes` and each named theme pulls in the base config.
  - So in tmux you can do `source-file ~/.config/tmux/themes/tokyo-night.conf` for example.
