{ config, pkgs, ... }:
{

    # update sub calendar
    #----------------------------------------

    systemd.timers."sub_calendar" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-*  *:28:00";
	    Persistent = "true";
	    Unit = "sub_calendar.service";
	};
    };

    systemd.services."sub_calendar" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    WorkingDirectory = "/home/blair/cloud_work/timesheet/";
	};
	path = with pkgs; [ 
	    bash
	    python3
	    R
	];
	script = ''
	    bash /home/blair/cloud_work/timesheet/runall.sh
	    '';
    };
}
