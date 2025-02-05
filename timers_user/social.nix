{ config, ... }:
{

    # social media scrape
    #----------------------------------------

    systemd.user.timers."social_scrape" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-* 05:00:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "social_scrape.service";
	};
    };

    systemd.user.services."social_scrape" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/cronjobs/active/scrape_social";
	};
    };

}
