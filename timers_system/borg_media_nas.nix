{ config, pkgs, ... }:
{

    # borg media
    #----------------------------------------

    systemd.timers."borg_media_nas" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "00/6:20";
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
	path = with pkgs; [ 
	    bash
	    borgbackup
	];
	script = ''
	    bash /home/blair/Projects/borg/media/backup_nas.sh
	    '';
    };

}

