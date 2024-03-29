# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Bootloader, Kernel, Params and modules
  boot = {
    # Specify kernel modules that are being loaded on all devices
    kernelModules = ["zram"];

    # Disable swraid to get rid of the warning
    swraid = {
      enable = false;
    };

    # Increase the vm.max_map_count
    kernel = {
      sysctl = {
        "vm.max_map_count" = 2147483642;
        "vm.swappiness" = 5;
      };
    };
  };

  networking = {
    # Wireless support via wpa_supplicant
    # wireless.enable = true;

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager = {
      enable = true;
    };
  };

  # Set your time zone.
  time = {
    timeZone = "Europe/Berlin";
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "de_DE.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  services = {
    flatpak = {
      enable = true;
    };

    openssh = {
      enable = true;
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
    };

    printing = {
      enable = true;
    };

    vnstat = {
      enable = true;
    };

    xserver = {
      layout = "de";
      xkbVariant = "";
    };
  };

  # Configure console keymap
  console = {
    keyMap = "de";
  };

  programs = {
    dconf = {
      enable = true;
    };
    firefox = {
      enable = true;
      languagePacks = ["de"];
    };
    nano = {
      enable = false; #Bye Bye Nano
    };
  };

  sound = {
    enable = true;
  };

  hardware = {
    pulseaudio = {
      enable = false;
    };
    uinput = {
      enable = true;
    };
  };

  security = {
    rtkit = {
      enable = true;
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Settings for the Nix package manager
  nix = {
    # Enable the flake command
    extraOptions = "experimental-features = nix-command flakes";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      diebetalea = {
        isNormalUser = true;
        description = "Die Beta Lea";
        extraGroups = ["networkmanager" "wheel"];
        packages = with pkgs; [
        ];
      };
    };
  };

  # nixpkg config and options
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  # Enable Swap on ZRAM
  zramSwap = {
    enable = true;
    # Set the limit to double the RAM
    memoryPercent = 50;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    sessionVariables = {
      FLAKE = "/home/diebetalea/Development/dotfiles";
      MOZ_ENABLE_WAYLAND = "1";
    };
    systemPackages = with pkgs; [
      anydesk
      btop
      cmatrix
      discord
      duf
      evince
      eza
      fsearch
      gitFull
      glxinfo
      gnome.gnome-disk-utility
      google-chrome
      gparted
      hardinfo
      hyfetch
      libreoffice
      lm_sensors
      lsb-release
      mcfly
      microsoft-edge
      neofetch
      nextcloud-client
      nh
      ntfs3g
      onlyoffice-bin
      pciutils
      pfetch
      radeontop
      shortwave
      smartmontools
      starship
      spotify
      tdesktop
      teamviewer
      usbutils
      unzip
      vesktop
      virt-viewer
      vivaldi
      vivaldi-ffmpeg-codecs
      vlc
      wget
      whatsapp-for-linux
      xdg-user-dirs
    ];
  };

  # Fonts
  fonts.packages = with pkgs; [
    arkpandora_ttf
    dina-font
    fira-code
    fira-code-symbols
    jetbrains-mono
    liberation_ttf
    mplus-outline-fonts.githubRelease
    nerdfonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    proggyfonts
    roboto
    ubuntu_font_family
    vegur
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
