{ pkgs, ... }:
{

    # docker
    virtualisation.docker.rootless =  {
	enable = true;
	setSocketVariable = true;
    };


    # nextcloud
    #-------------------------------------------

    environment.etc."nextcloud-admin-pass".text = "test123";
    services.nextcloud = {
	enable = true;
	package = pkgs.nextcloud29;
	hostName = "localhost";
	config.adminpassFile = "/etc/nextcloud-admin-pass";
    };


}
