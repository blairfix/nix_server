{ config, pkgs, ... }:
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
	    WorkingDirectory = "/home/blair/Projects/borg/blair";
	};

	path = with pkgs;
	let  R-with-my-packages = rWrapper.override{
            packages = with rPackages; [ 
		mailR
	    ];
	};
	in [ 
	    bash
	    borgbackup
	    R-with-my-packages 
	];

	script = ''
	    bash /home/blair/Projects/borg/blair/backup.sh
	    '';
    };

}
