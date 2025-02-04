{ pkgs, ... }:
{

    services.transmission = { 
	enable = true; 
	    openRPCPort = true; #Open firewall for RPC
	    settings = { 
		rpc-bind-address = "0.0.0.0"; 
		rpc-whitelist = "127.0.0.1,10.0.0.1"; 
		download-dir = "${config.services.transmission.home}/Downloads";
	    };
    };

}
