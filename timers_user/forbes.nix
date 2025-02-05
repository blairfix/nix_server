{ config, ... }:
{

    # forbes 
    #----------------------------------------

    systemd.user.timers."forbes" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 21:38:00";
	    AccuracySec= "1sec";
	    Persistent = "true";
	    Unit = "forbes.service";
	};
    };

    systemd.user.services."forbes" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/cloud_work/empirical_research/scrape_forbes/run.sh";
	};
    };

}
