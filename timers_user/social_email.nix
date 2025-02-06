{ config, pkgs, ... }:
{

    # social email
    #----------------------------------------

    systemd.timers."social_email" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-01 07:30:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "social_email.service";
	};
    };

    systemd.services."social_email" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/Projects/scrape_twitter/email/send_analysis.sh";
	};
    };

}
