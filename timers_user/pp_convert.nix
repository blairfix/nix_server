{ config, ... }:
{

    # photoprism convert 
    #----------------------------------------

    systemd.user.timers."pp_convert" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar="*-*-* 03:23:00";
	    Persistent = "true";
	    Unit = "pp_convert.service";
	};
    };

    systemd.user.services."pp_convert" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/cronjobs/active/photoprism_convert_backup";
	};
    };

}
