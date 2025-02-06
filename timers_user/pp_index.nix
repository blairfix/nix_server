{ config, pkgs, ... }:
{

    # photoprism index
    #----------------------------------------

    systemd.timers."pp_index" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar="*-*-* 06,10,12,16,20:00:00";
	    Persistent = "true";
	    Unit = "pp_index.service";
	};
    };

    systemd.services."pp_index" = {
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
	    bash /home/blair/cronjobs/active/photoprism_index
	    '';
    };

}
