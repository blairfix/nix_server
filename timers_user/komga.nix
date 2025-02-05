{ config, ... }:
{

    # komga 
    #----------------------------------------

    systemd.user.timers."komga" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "komga.service";
	};
    };

    systemd.user.services."komga" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/cronjobs/active/komga_start";

	};
    };

}
