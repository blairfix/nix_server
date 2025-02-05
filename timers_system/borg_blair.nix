{ config, ... }:
{

    # borg blair
    #----------------------------------------

    systemd.timers."borg_blair" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-*  *:05:00";
	    Persistent = "true";
	    Unit = "borg_blair.service";
	};
    };

    systemd.services."borg_blair" = {
	serviceConfig = {
	    Type = "simple";
	    User = "root";
	    ExecStart = "/home/blair/Projects/borg/blair/backup.sh";
	};
    };

}
