# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "bmehdi-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = ["8.8.8.8" "1.1.1.1"];
  networking.networkmanager.dns = "none";

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Sound
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  # Nvidia driver
  hardware.opengl = {
    enable = true;
  };
  hardware.nvidia = {
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    modesetting.enable = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "intl";
    enable = true;
    videoDrivers = ["nvidia"];
    desktopManager.xfce = {
      enable = true;
      noDesktop = true;
      enableXfwm = false;
    };
    windowManager.bspwm.enable = true;
    displayManager = {
      lightdm = {
        enable = true;
        background = "/usr/share/pixmaps/wavesia.jpg";
      };
      sessionCommands = "xset r rate 400 50";
      defaultSession = "none+bspwm";
    };
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bmehdi = {
    isNormalUser = true;
    description = "bmehdi";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
		packages = let unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
		in with pkgs; [ 
			chezmoi
			neovim
			discord
			fzf
			tmux
			telegram-desktop
			python3 
			eza
			atuin
			starship
			firefox
			nodejs_20
			rofi
			bat
			flameshot
			spotify
			rustup
			lazygit
			delta
			bcc

			unstable.obsidian
			];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  wget
    vim 
    neovim
    kitty
    ripgrep
    git
    polybar
    zsh
    wget
    unzip
    gcc
    google-chrome
    pavucontrol
    picom
  ];

  programs.zsh.enable = true;
  programs.ssh.startAgent = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  system.stateVersion = "23.11"; # Did you read the comment?

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  nix.settings.experimental-features = "nix-command flakes";

  nix.gc = {
    automatic = true;
    persistent = true;
    dates = "21:00:00";
    options = "--delete-older-than 7d";
  };
}
