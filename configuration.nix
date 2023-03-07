
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Hosts / Networking 	
  networking.hostName = "winxp";
  networking.networkmanager.enable = true;
  
  # Time / Locales
  time.timeZone = "Africa/Tunis";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  # Console
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };
  # Shell
  programs.fish.enable = true;
  # Docker
  virtualisation.docker.enable = true;
  
  # User
  users.users.mami = {
    isNormalUser = true;
    description = "mami";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" "audio" "video" "input" "systemd-journal" "network" "davfs2" ];
    packages = with pkgs; [
      google-chrome
      starship
      stow
      neovim
      discord
      spotify
      sublime4
      transmission-gtk
      fzf
      gcc
      hypnotix
      freetube
      vscode
      notion-app-enhanced
      gnutar
      git
      gh
      grim
      slurp
      swappy
      micro
      tmate
      coursera-dl
      mpv
      firefox
      materia-kde-theme
      papirus-icon-theme
    ];
  };
  security.polkit.enable = true;
  
  # Printing
  services.printing.enable = true;
  
  # Backlight
  programs.light.enable = true;
  
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;
  

  # Window Manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      i3status
      pavucontrol
      foot
      wofi
      mpv
      xfce.thunar
    ];
  };

  # Env Variables
  environment.sessionVariables = { 
    GTK_THEME="Materia-dark-compact"; 
    ICON_THEME="Papirus-Dark";
    QT_QPA_PLATFORM="wayland-egl";
    QT_WAYLAND_DISABLE_WINDOWDECORATION="1";
    SDL_VIDEODRIVER="wayland";
    WLR_NO_HARDWARE_CURSORS="1";
    _JAVA_AWT_WM_NONREPARENTING="1";
  };


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Cursor configuration
  # GTK configuration
  # Fonts
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs;[
      inconsolata-nerdfont
      fira
      fira-code
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Fira Sans"];
        sansSerif = ["Fira Sans"];
        monospace = ["Inconsolata Nerd Font"];
      };
    };
  };
  # Theming
  qt5.enable = true;
  qt5.platformTheme = "gtk2";
  qt5.style = "gtk2";
  system.stateVersion = "22.11";
}
