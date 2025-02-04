{ config, ... }:
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
	    ExecStart = "/home/blair/Projects/borg/blair/backup.sh";
	};
    };


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


    # camera sync
    #----------------------------------------

    systemd.timers."camera_sync" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-* *:00:00";
	    RandomizedDelaySec = "40";
	    Persistent = "true";
	    Unit = "camera_sync.service";
	};
    };

    systemd.services."camera_sync" = {
	serviceConfig = {
	    Type = "simple";
	    User = "root";
	    ExecStart="/home/blair/cronjobs/active/camera_sync";
	};
    };

}
