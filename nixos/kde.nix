# KDE-specific config
{ config, pkgs, ... }: {
  config = {
    services = {
      xserver = {
        enable = true;
        displayManager = {
          sddm = {
            enable = true;
          };
        };
      };
      desktopManager = {
        plasma6 = {
          enable = true;
        };
      };

      # fwupd service
      fwupd = {
        enable = true;
      };
    };

    # XDG Desktop Portal
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-kde
        ];
      };
    };

    programs = {
      partition-manager = {
        enable = true;
      };
    };

    # KDE-specific packages
    environment = {
      systemPackages = with pkgs; [
        pciutils
      ] ++ (with kdePackages; [
        filelight
        kate
        kcalc
        kwallet-pam
      ]);
    };
  };
}