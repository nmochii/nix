# Nix

Personal NixOS and home-manager configurations.

## Two deployment modes

### Standalone home-manager (`mkHome`)

For non-NixOS hosts. Manages user environment only. System services (NetworkManager, PipeWire, greetd, …) stay on the host OS.

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

Manages the system and home-manager: users, locale, agenix, and optional NixOS modules (`modules.network`, `modules.audio`, …). A graphical host enables those from `configuration.nix` and the home-manager UI stack from `home.nix` / `ui.nix`.

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

Register the host in `flake.nix` under `homeConfigurations` or `nixosConfigurations`. Shared pieces live in `nixos/` and `home-manager/`; the host folder should only hold deltas.

### NixOS host (`mkSystem`)

Create `hosts/<hostname>/` with:

- `default.nix` — imports `./hardware-configuration.nix` and `./configuration.nix`
- `configuration.nix` — hostname, boot, `system.stateVersion`, lab-only policy, and NixOS module toggles (`modules.network.enable`, `modules.audio.enable`)
- `hardware-configuration.nix` — generated, never shared
- `home.nix` — `home.stateVersion` and host-specific home-manager (`modules.editor` / `shell` / `tools` / `vcs`; `modules.ui` / `modules.terminal` only on graphical hosts; `modules.tools.extrasEnable` for extra CLI tools)
- `ui.nix` — required when `modules.ui.enable` or `modules.terminal.enable` is set (`interface`, `terminal`, wallpaper)

### Standalone home-manager host (`mkHome`)

Create `hosts/<hostname>/` with:

- `default.nix` — extras only (for example olfeo)
- `home.nix` — `home.stateVersion`, HM module toggles (`modules.ui` / `modules.terminal`, `modules.tools.extrasEnable`, …), genericLinux, nixGL, and other foreign-distro bits
- `ui.nix` — desktop prefs (`interface`, `terminal`, wallpaper)

Then:

1. Create a user config in `users/` if needed
2. Register the host in `flake.nix`
3. Update nixpkgs and home-manager together, then apply

## Updating

Always bump nixpkgs and home-manager together so HM modules match nixpkgs:

```sh
nix flake update nixpkgs home-manager
```

Eval both current outputs:

```sh
./check.sh
```
