{ config, pkgs, ... }:
{

    # photoprism 
    #----------------------------------------

    systemd.timers."photoprism" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "photoprism.service";
	};
    };

    systemd.services."photoprism" = {
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
	    bash /home/blair/cronjobs/active/photoprism_start
	    '';
    };
}
