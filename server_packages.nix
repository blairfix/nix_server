{ pkgs, ... }:
{

    # docker
    virtualisation.docker.rootless =  {
	enable = true;
	setSocketVariable = true;
    };


    # jellyfin
    #-------------------------------------------

    services.jellyfin = {
	enable = true;
	openFirewall = true;
    };

    environment.systemPackages = [

	# jellyfin
	pkgs.jellyfin
	    pkgs.jellyfin-web
	    pkgs.jellyfin-ffmpeg

    ];

    # nextcloud
    #-------------------------------------------

    environment.etc."nextcloud-admin-pass".text = "test123";
    services.nextcloud = {
	enable = true;
	package = pkgs.nextcloud28;
	hostName = "localhost";
	config.adminpassFile = "/etc/nextcloud-admin-pass";
    };


}
