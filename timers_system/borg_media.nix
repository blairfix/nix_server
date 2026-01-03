{ config, pkgs, ... }:
{

    # borg media
    #----------------------------------------

    systemd.timers."borg_media" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "00/6:20";
	    Persistent = "true";
	    Unit = "borg_media.service";
	};
    };

    systemd.services."borg_media" = {
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
	    bash /home/blair/Projects/borg/media/backup.sh
	    '';
    };

}

