{ config, ... }:
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
	    ExecStart = "/home/blair/Projects/borg/media/backup.sh";
	};
    };

}

