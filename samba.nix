{ config, ... }:
{

    services.samba = {
	enable = true;
	securityType = "user";
	openFirewall = true;
	settings = {
	    global = {
		"workgroup" = "WORKGROUP";
		"server string" = "blair-server";
		"netbios name" = "blair-server";
		"security" = "user";
		"hosts allow" = "192.168.0. 127.0.0.1 localhost";
	    };

	    "public" = {
		"path" = "/home/blair/emily";
		"browseable" = "yes";
		"read only" = "no";
		"guest ok" = "yes";
		"create mask" = "0644";
		"directory mask" = "0755";
		"force user" = "username";
		"force group" = "groupname";
	    };

	    "private" = {
		"path" = "/home/blair/emily";
		"browseable" = "yes";
		"read only" = "no";
		"guest ok" = "no";
		"create mask" = "0644";
		"directory mask" = "0755";
		"force user" = "username";
		"force group" = "groupname";
	    };

	};
    };

    services.samba-wsdd = {
	enable = true;
	openFirewall = true;
    };

    services.avahi = {
	publish.enable = true;
	publish.userServices = true;
	nssmdns4 = true;
	enable = true;
	openFirewall = true;
    };


    networking.firewall.enable = true;
    networking.firewall.allowPing = true;


}
