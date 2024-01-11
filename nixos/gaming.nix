{ config, pkgs, ... }: {

  config = {  
    boot = {
      blacklistedKernelModules = [
        "xpad"
      ];
    };
    programs = {
      steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      };
    };

    # Enable the Hardware
    hardware = {
      steam-hardware = {
        enable = true;
        };
      };
    
    services = {
      udev = {
        extraRules = ''
          # Xbox Controllers
          SUBSYSTEMS=="usb", ATTRS{idVendor}=="045e", GROUP="users", TAG+="uaccess"
        '';
      };
    };
  
    # Gaming-specific packages
    environment.systemPackages = with pkgs; [
      bottles
      cartridges
      gamemode
      minecraft
      osu-lazer-bin
      space-cadet-pinball
      superTuxKart
      wineWowPackages.fonts
      wineWowPackages.unstableFull
      winetricks
      xboxdrv
    ];
  };
}
