{ config, pkgs, ... }:
{

    # social email
    #----------------------------------------

    systemd.timers."social_email" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-01 04:25:00";
	    RandomizedDelaySec = "3";
	    Persistent = "true";
	    Unit = "social_email.service";
	};
    };

    systemd.services."social_email" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};

	path = with pkgs; [ 
	    bash
	    R
	];
	script = ''
	    bash /home/blair/Projects/scrape_twitter/email/send_analysis.sh
	    '';
    };
}


