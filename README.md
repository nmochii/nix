# Home Manager

## Installation (standalone)

Requirements:
- sudo

Steps:
1. Install nix

```sh
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
```

2. Install home-manager

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

3. Activate experimental nix command flake

```sh
sudo tee /etc/nix/nix.conf -a << EOF
warn-dirty = false
experimental-features = nix-command flakes
EOF
```

4. Create a host config
5. Create a user config
6. Link home-manager to your config
7. Create the `~/SSoT` config dir
8. Run `nix flake update`

```sh
ln -s /path/to/host/config $HOME/.config/home-manager
```

9. Install a desktop environement
10. Run `home-manager switch`

```sh
# gnome
sudo apt install gdm3
sudo systemctl enable gdm
sudo systemctl start gdm
```
