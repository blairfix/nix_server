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

    systemd.services."sub_calendar" = let
	python = pkgs.python3.withPackages (ppkgs: with ppkgs; [
		caldav
		pandas
		datetime
	]);
    in {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    WorkingDirectory = "/home/blair/cloud_work/timesheet/";
	};
	path = with pkgs; [ 
	    bash
	    python
	    R
	];
	script = ''
	    bash /home/blair/cloud_work/timesheet/runall.sh
	    '';
    };
}
