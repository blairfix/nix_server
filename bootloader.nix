{ config, lib,  ... }:
{

    boot.loader = {

	# grub
	#-----------------------------------

	grub = lib.mkIf (config.networking.hostName == "blair-server") {
	    devices = [ "nodev" ];
	    enable = true;
	    useOSProber = true;
	};


	# systemd
	#-----------------------------------

	systemd-boot = lib.mkIf (config.networking.hostName == "blair-laptop") {
	    enable = true;
	};

	efi = lib.mkIf (config.networking.hostName == "blair-laptop") {
	    canTouchEfiVariables= true;
	};

    };
}
