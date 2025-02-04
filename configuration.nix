{ config, pkgs, ... }:
{
    imports =
	[ 
	    ./hardware-configuration.nix

	    # configs
	    ./r_packages.nix
	    ./python_packages.nix
	    ./packages.nix
	    ./fonts.nix
	    ./nvim.nix
	    ./bootloader.nix

	    # server configs
	    #./server_timers.nix
	    #./server_packages.nix
	];

    # kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    # hostname
    networking.hostName = "blair-laptop"; 

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
    services.openssh.enable = true;

    # virtualization
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;

    # sound with pipewire
    #sound.enable = true;
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	#jack.enable = true;
    };

    services.pipewire.wireplumber.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

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


    # for bash scripts 
    services.envfs.enable = true;

    # home directories
    systemd.tmpfiles.rules = [
	"d /home/blair/Desktop 755 blair users -"
	    "d /home/blair/Downloads 755 blair users -"
	    "d /home/blair/bin 755 blair users -"
    ];


    # version 
    system.stateVersion = "24.05"; 

}
