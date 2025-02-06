{ config, pkgs, ... }:
{

    # komga 
    #----------------------------------------

    systemd.timers."komga" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "komga.service";
	};
    };

    systemd.services."komga" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};

	path = with pkgs; [
	    docker
	    docker-compose
	    bash
	];
	script = ''
	    bash /home/blair/cronjobs/active/komga_start
	    '';
    };
}
