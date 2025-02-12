{ config, pkgs, ... }:
{
    imports =
	[ 
	./hardware-configuration.nix


	    # configs
	    #----------------------------

	    ./r_packages.nix
	    ./python_packages.nix
	    ./packages.nix
	    ./fonts.nix
	    ./nvim.nix

	    # server configs
	    #----------------------------

	    ./transmission.nix
	    ./samba.nix
	    ./caddy.nix


	    # system timers
	    #----------------------------

	    ./timers_system/borg_blair.nix
	    ./timers_system/borg_media.nix
	    ./timers_system/camera_sync.nix


	    # user timers
	    #----------------------------

	    ./timers_user/audiobookshelf.nix
	    ./timers_user/forbes.nix
	    ./timers_user/jellyfin.nix
	    ./timers_user/komga.nix
	    ./timers_user/photoprism.nix
	    ./timers_user/pp_convert.nix
	    ./timers_user/pp_index.nix
	    ./timers_user/rclone.nix
	    ./timers_user/sf_archive.nix
	    ./timers_user/smartfind.nix
	    ./timers_user/social_email.nix
	    ./timers_user/social.nix
	    ./timers_user/television.nix
	    ./timers_user/thunderbird.nix
	    ./timers_user/wordpress.nix

	    ];

    # bootloader
    boot.loader.grub = {
	enable = true;
	useOSProber = true;
	device = "/dev/sda";
    };

    # kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # hostname
    networking.hostName = "blair-server"; 

    # networking
    networking.networkmanager.enable = true;

    # time zone
    time.timeZone = "America/Edmonton";

    # utf8 setting
    i18n.defaultLocale = "en_CA.UTF-8";

    # enable sway window manager
    programs.sway = {
	enable = true;
	wrapperFeatures.gtk = true;
    };

    # wayland screen sharing
    xdg.portal = {
	enable = true;
	wlr.enable = true;
    };

    # syncthing
    services.syncthing = {
	enable = true;
	user = "blair";
	dataDir = "/home/blair/cloud_work"; 
	configDir = "/home/blair/.config/syncthing";
    };

    # cups
    services.printing.enable = true;

    # tailscale
    services.tailscale.enable = true;

    # ssh
    services.openssh = {
	enable = true;
	ports = [ 1497 ];
	settings = {
	    PasswordAuthentication = false;
	    PermitRootLogin = "no"; 
	};
    };


    # virtualization
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    # sound with pipewire
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
    };

    services.pipewire.wireplumber.enable = true;


    # user account. Add password with ‘passwd’.
    users.users.blair = {
	isNormalUser = true;
	description = "blair";
	extraGroups = [ 
	    "networkmanager" 
	    "wheel" 
	    "docker"
	    "libvirtd"
	];
    };

    # unfree packages
    nixpkgs.config.allowUnfree = true;

    # docker
    virtualisation.docker.enable = true;

    # for bash scripts 
    services.envfs.enable = true;

    # mount directories
    systemd.tmpfiles.rules = [
	    "d /media/blair/multimedia 755 blair users -"
	    "d /media/blair/Backup_drive 755 blair users -"
    ];


    # version 
    system.stateVersion = "24.05"; 

}
