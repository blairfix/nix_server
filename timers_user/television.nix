{ config, ... }:
{

    # television rss
    #----------------------------------------

    systemd.user.timers."television" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*:0,15,30,45";
	    Unit = "television.service";
	};
    };

    systemd.user.services."television" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/Projects/television/runall.sh"
	};
    };

}
