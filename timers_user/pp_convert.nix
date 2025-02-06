{ config, pkgs, ... }:
{

    # photoprism convert 
    #----------------------------------------

    systemd.timers."pp_convert" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar="*-*-* 03:23:00";
	    Persistent = "true";
	    Unit = "pp_convert.service";
	};
    };

    systemd.services."pp_convert" = {
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
	    bash /home/blair/cronjobs/active/photoprism_convert_backup
	    '';
    };
}
