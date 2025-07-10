{ config, pkgs, inputs, ... }:

{
  imports = [
		./hardware-configuration.nix
	];

  # Bootloader.
	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

	#>> Fix touchpad
	boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ];

  networking = {
		hostName = "nixos"; # Define your hostname.
		networkmanager.enable = true;
	};

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Localization settings
  i18n = {
		defaultLocale = "en_US.UTF-8";
		extraLocaleSettings = {
			LC_ADDRESS = "pt_BR.UTF-8";
			LC_IDENTIFICATION = "pt_BR.UTF-8";
			LC_MEASUREMENT = "pt_BR.UTF-8";
			LC_MONETARY = "pt_BR.UTF-8";
			LC_NAME = "pt_BR.UTF-8";
			LC_NUMERIC = "pt_BR.UTF-8";
			LC_PAPER = "pt_BR.UTF-8";
			LC_TELEPHONE = "pt_BR.UTF-8";
			LC_TIME = "pt_BR.UTF-8";
		};
	};
	
	services.xserver = {
		enable = true;
		wacom.enable = true;

		# Enable GDM 
		displayManager.gdm.enable = true;
		# Enable Gnome
		desktopManager.gnome.enable = true;

		xkb = { # Default keyboard layout + variant
			layout = "br";
			variant = "";
		};
	};

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Audio fix
  hardware.enableAllFirmware = true;
  boot.extraModprobeConfig = ''
    options snd-intel-dspcfg dsp_driver=1
  '';

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Define a user account
  users.users.henrique = {
    isNormalUser = true;
    description = "Henrique"; # Nomezinho "bonitinho", completo
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [ # Pacotes específicos do usuário
    #  thunderbird
    ];
  };

	programs = {
    # Firefox
    firefox.enable = true;

    # Steam
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    # Starship
    starship = {
      enable = true;
      settings = {
        add_newline = true;
        character = {
  				success_symbol = "[➜](bold green)";
  				error_symbol = "[➜](red)";
				};
        nix_shell = {
          symbol = " ";
          heuristic = false;
        };
        username = {
          show_always = true;
          style_user = "green bold";
          style_root = "bright-red bold";
        };
        os.disabled = true;
        # palette = "catppuccin_${"mocha"}";
      };
    };

  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [

    #CLI -> Essential
    vim-full #Complete package of vim
		inputs.nixvim.packages.${pkgs.system}.default #neovim
    git
    wezterm
    fzf
    zip
    unzip

    #CLI -> Pretty and shiny :D
    bat
    tree
    eza
    neofetch

    #Image/Video stuff
    # pix # Image viewer/editor. Pretty cool
    # rawtherapee # FOSS similar to adobe lightroom
    # krita # Drawing stuff
    vlc

    #Nonfree entertainment
    stremio
    discord
    spotify

    #Hardware/Libs
    gparted
    fan2go

    #Other
    cava
    jetbrains-mono # Best font for programming
    obsidian # Note taking app
		libreoffice # libreoffice

		# Gnome stuff
		gnome-extension-manager
		gnome-tweaks

		# >> Gnome Extensions
		pkgs.gnomeExtensions.dash-to-dock
		pkgs.gnomeExtensions.caffeine
		pkgs.gnomeExtensions.clipboard-indicator
		pkgs.gnomeExtensions.blur-my-shell
		pkgs.gnomeExtensions.burn-my-windows
		pkgs.gnomeExtensions.gsconnect
		pkgs.gnomeExtensions.hide-top-bar
		pkgs.gnomeExtensions.vitals
		pkgs.gnomeExtensions.just-perfection
		gnomeExtensions.wallpaper-slideshow
	];
	
	environment.localBinInPath = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
