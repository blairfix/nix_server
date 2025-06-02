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

	path = with pkgs;

	let R-with-my-packages = rWrapper.override{
	    packages = with rPackages; [ 
		data_table
		here
		lubridate
		magrittr

	    ];
	};

	in [ 
	    bash
	    python
	    R-with-my-packages
	];
	script = ''
	    bash /home/blair/cloud_work/timesheet/runall.sh
	    '';
    };
}
