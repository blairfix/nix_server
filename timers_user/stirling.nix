{ config, pkgs, ... }:
{

    # stirling 
    #----------------------------------------

    systemd.timers."stirling" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "stirling.service";
	};
    };

    systemd.services."stirling" = {
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
	    bash /home/blair/cronjobs/active/stirling_start
	    '';
    };
}
