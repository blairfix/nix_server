{ config, pkgs, ... }:
{

    # nextcloud 
    #----------------------------------------

    systemd.timers."nextcloud" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "nextcloud.service";
	};
    };

    systemd.services."nextcloud" = {
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
	    bash /home/blair/cronjobs/active/nextcloud_start
	    '';
    };
}
