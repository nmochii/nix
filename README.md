# Nix

Personal NixOS and home-manager configurations.

## Two deployment modes

### Standalone home-manager (`mkHome`)

For non-NixOS hosts. Manages user environment only.

```nix
homeConfigurations."user@hostname" = mkHome {
  hostModule = ./hosts/hostname;
  system = "x86_64-linux";
  user = import ./users/user.nix;
};
```

Apply with:

```sh
home-manager switch --flake .
```

### Full NixOS system (`mkSystem`)

Manages the entire system including users, locale, and home-manager.

```nix
nixosConfigurations.hostname = mkSystem {
  hostModule = ./hosts/hostname;
  system = "x86_64-linux";
  user = import ./users/user.nix;
};
```

Apply with:

```sh
sudo nixos-rebuild switch --flake .
```

## Adding a new host

1. Create `hosts/<hostname>/` with:
   - `default.nix` — host module (hardware, services, packages)
   - `home.nix` — enables home-manager modules (`editor`, `shell`, `tools`, …)
   - `ui.nix` — UI preferences (optional, only needed if `ui.enable = true`)
2. Create a user config in `users/`
3. Register the host in `flake.nix` under `homeConfigurations` or `nixosConfigurations`
4. Run `nix flake update` then apply

## Bootstrap (non-NixOS)

1. Install nix

```sh
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --no-daemon
```

2. Enable flakes

```sh
mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf
```
