{ config, ... }:
{

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
