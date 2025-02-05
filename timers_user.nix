{ config, ... }:
{


    # rclone
    #----------------------------------------

    systemd.timers."rclone" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "00/4:10";
	    RandomizedDelaySec = "60";
	    Persistent = "true";
	    Unit = "rclone.service";
	};
    };

    systemd.services."rclone" = {
	serviceConfig = {
	    Type = "simple";
	    User = "config.users.users.default.name";
	    ExecStart="/home/config.users.users.default.name/cronjobs/active/rclone";
	};
    };


    # forbes 
    #----------------------------------------

    systemd.timers."forbes" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 21:38:00";
	    AccuracySec= "1sec";
	    Persistent = "true";
	    Unit = "forbes.service";
	};
    };

    systemd.services."forbes" = {
	serviceConfig = {
	    Type = "simple";
	    User = "config.users.users.default.name";
	    ExecStart = "/home/config.users.users.default.name/cloud_work/empirical_research/scrape_forbes/run.sh";
	};
    };


    # social media scrape
    #----------------------------------------

    systemd.timers."social_scrape" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-* 05:00:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "social_scrape.service";
	};
    };

    systemd.services."social_scrape" = {
	serviceConfig = {
	    Type = "simple";
	    User = "config.users.users.default.name";
	    ExecStart = "/home/config.users.users.default.name/cronjobs/active/scrape_social";
	};
    };


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
	    User = "config.users.users.default.name";
	    ExecStart = "/home/config.users.users.default.name/Projects/scrape_twitter/email/send_analysis.sh";
	};
    };


    # wordpress_scrape 
    #----------------------------------------

    systemd.timers."wordpress_scrape" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-02 05:30:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "wordpress_scrape.service";
	};
    };

    systemd.services."wordpress_scrape" = {
	serviceConfig = {
	    Type = "simple";
	    User = "config.users.users.default.name";
	    ExecStart = "/home/config.users.users.default.name/Projects/scrape_wordpress/RUNALL.sh";
	};
    };



