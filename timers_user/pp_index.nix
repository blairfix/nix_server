{ config, ... }:
{

    # photoprism index
    #----------------------------------------

    systemd.user.timers."pp_index" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar="*-*-* 06,10,12,16,20:00:00";
	    Persistent = "true";
	    Unit = "pp_index.service";
	};
    };

    systemd.user.services."pp_index" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart="/home/blair/cronjobs/active/photoprism_index";
	};
    };

}
