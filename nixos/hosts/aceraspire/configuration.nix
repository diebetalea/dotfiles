# aceraspire specific config
{ config, pkgs, inputs, ... }: {
  
  imports = [
    ../../gaming.nix
    ../../gnome-games.nix
    ../../kde.nix
    ../../kde-games.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "AspireNix2401-X";
  };
  
  hardware = {
    bluetooth = {
      enable = true;
    };
  };

  services = {    
    pipewire = {
      jack = {
        enable = false;
      };
    };

    printing = {
      enable = true;
      drivers = with pkgs; [
        epson-escpr2  # Add drivers for Epson WF-7710 printer support
      ];
    };

    udev = {
      extraRules = ''
        # Bluetooth Adapter
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="04ca", GROUP="users", TAG+="uaccess"
      '';
    };
  };

  virtualisation = {
    
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
    };
  };

  programs = {
    ausweisapp = {
      enable = true;
    };

    fish = {
      enable = true;
    };

    geary = {
      enable = true;
    };
  };

  users = {
    users = {
      diebetalea = {
        extraGroups = [];
        shell = pkgs.fish;
      };
    };

    groups = {
      libvirtd = {
        members = ["root" "diebetalea"];
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      distrobox
    ];
  };
}
