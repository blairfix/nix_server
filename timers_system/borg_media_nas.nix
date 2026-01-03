{ config, pkgs, ... }:
{

    # borg media
    #----------------------------------------

    systemd.timers."borg_media_nas" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 03:20:00";
	    Persistent = "true";
	    Unit = "borg_media_nas.service";
	};
    };

    systemd.services."borg_media_nas" = {
	serviceConfig = {
	    Type = "simple";
	    User = "root";
	    WorkingDirectory = "/home/blair/Projects/borg/media";

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
	    bash /home/blair/Projects/borg/media/backup_nas.sh
	    '';
    };

}

