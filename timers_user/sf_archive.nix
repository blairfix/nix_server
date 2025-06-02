{ config, pkgs, ... }:
{
    # sf_archive archive
    #----------------------------------------

    systemd.timers."sf_archive" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "weekly";
	    #OnCalendar= "*-*-* 02:31:00";
	    Persistent = "true";
	    Unit = "sf_archive.service";
	};
    };

    systemd.services."sf_archive" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};

	path = with pkgs;
	let  R-with-my-packages = rWrapper.override{
            packages = with rPackages; [ 
		here
		lubridate
		magrittr
	    ];
	};

	in [
	    bash
	    trash-cli
	    gnutar
	    xz
	    R-with-my-packages
	];
	script = ''
	   bash /home/blair/cronjobs/active/sf_archive 
	    '';
    };
}
