# Nix

## Installation (standalone home-manager)

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

4. Clone this repo and create the `~/SSoT/` directory
5. Create a host config under `hosts/`
6. Create a user config under `users/`
7. Register the host in `flake.nix`
8. Run `nix flake update` at the repo root
9. Run `home-manager switch --flake .`

## Adding a new host

Create a directory under `hosts/<hostname>/` with:
- `default.nix` - imports external modules and host-specific config
- `home.nix` - home-manager settings, module enables
- `ui.nix` - UI preferences (terminal, interface, wallpaper)

Register it in the top-level `flake.nix`:
```nix
homeConfigurations."user@hostname" = mkHome {
  hostModule = ./hosts/hostname;
  user = import ./users/user.nix;
};
```
