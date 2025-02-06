{ config, pkgs, ... }:
{

    # jellyfin 
    #----------------------------------------

    systemd.timers."jellyfin" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "jellyfin.service";
	};
    };

    systemd.services."jellyfin" = {
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
	    bash /home/blair/cronjobs/active/jellyfin_start
	    '';
    };
}
