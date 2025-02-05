{ config, ... }:
{

    # jellyfin 
    #----------------------------------------

    systemd.user.timers."jellyfin" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "jellyfin.service";
	};
    };

    systemd.user.services."jellyfin" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/cronjobs/active/jellyfin_start";

	};
    };

}
