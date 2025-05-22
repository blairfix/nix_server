{ config, pkgs, ... }:
{

    # borg blair
    #----------------------------------------

    systemd.timers."borg_blair_nas" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 03:00:00";
	    Persistent = "true";
	    Unit = "borg_blair_nas.service";
	};
    };

    systemd.services."borg_blair_nas" = {
	serviceConfig = {
	    Type = "simple";
	    User = "root";
	    WorkingDirectory = "/home/blair/Projects/borg/blair";
	};

	path = with pkgs; [ 
	    bash
	    borgbackup
	];
	script = ''
	    bash /home/blair/Projects/borg/blair/backup_nas.sh
	    '';
    };

}
