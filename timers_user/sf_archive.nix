{ config, ... }:
{
    # sf_archive archive
    #----------------------------------------

    systemd.user.timers."sf_archive" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "weekly";
	    Persistent = "true";
	    Unit = "sf_archive.service";
	};
    };

    systemd.user.services."sf_archive" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/cloud_work/smart_find/make_archive.sh";

	};
    };
}
