{ config, pkgs, ... }:
{

    # mealie 
    #----------------------------------------

    systemd.timers."mealie" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "mealie.service";
	};
    };

    systemd.services."mealie" = {
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
	    bash /home/blair/cronjobs/active/mealie_start
	    '';
    };
}
