{ config, ... }:
{


    # rclone
    #----------------------------------------

    systemd.user.timers."rclone" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "00/4:10";
	    RandomizedDelaySec = "60";
	    Persistent = "true";
	    Unit = "rclone.service";
	};
    };

    systemd.user.services."rclone" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart="/home/blair/cronjobs/active/rclone";
	};
    };


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


    # social email
    #----------------------------------------

    systemd.user.timers."social_email" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-01 07:30:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "social_email.service";
	};
    };

    systemd.user.services."social_email" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/Projects/scrape_twitter/email/send_analysis.sh";
	};
    };


    # wordpress_scrape 
    #----------------------------------------

    systemd.user.timers."wordpress_scrape" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-02 05:30:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "wordpress_scrape.service";
	};
    };

    systemd.user.services."wordpress_scrape" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/Projects/scrape_wordpress/RUNALL.sh";
	};
    };


}
