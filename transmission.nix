{ pkgs, ... }:
{

services.transmission = { 
	enable = true; 
	package = pkgs.transmission_4;
	openRPCPort = true; 
	user = "blair";
	settings = { 
	    rpc-bind-address = "0.0.0.0"; 
	    rpc-whitelist = "127.0.0.1,10.0.0.1,100.119.207.114"; 
	    download-dir = "/media/blair/multimedia/tv_downloads";
	    incomplete-dir = "/media/blair/multimedia/tv_downloads/temp";
	};
    };

}
