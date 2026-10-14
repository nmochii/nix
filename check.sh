#!/usr/bin/env bash
nix eval .#nixosConfigurations.virtual-mochi.config.system.build.toplevel.drvPath && nix eval '.#homeConfigurations."akhe@agent-mochi".activationPackage.drvPath'
