{ config, ... }:
{

    # borg blair
    #----------------------------------------

    systemd.timers."borg_blair" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-*  *:05:00";
	    Persistent = "true";
	    Unit = "borg_blair.service";
	};
    };

    systemd.services."borg_blair" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/Projects/borg/blair/backup.sh";
	};
    };



    # borg media
    #----------------------------------------

    systemd.timers."borg_media" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "00/6:20";
	    Persistent = "true";
	    Unit = "borg_media.service";
	};
    };

    systemd.services."borg_media" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/Projects/borg/media/backup.sh";
	};
    };



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
	    User = "blair";
	    ExecStart="/home/blair/cronjobs/active/camera_sync";
	};
    };



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
	    User = "blair";
	    ExecStart="/home/blair/cronjobs/active/rclone";
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
	    User = "blair";
	    ExecStart = "/home/blair/cloud_work/empirical_research/scrape_forbes/run.sh";
	};
    };


    # mastodon 
    #----------------------------------------

    systemd.timers."mastodon" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-* 05:30:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "mastodon.service";
	};
    };

    systemd.services."mastodon" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/Projects/scrape_mastodon/download_followers.py";
	};
    };



    # twitter_scrape 
    #----------------------------------------

    systemd.timers."twitter_scrape" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-* 05:00:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "twitter_scrape.service";
	};
    };

    systemd.services."twitter_scrape" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/Projects/scrape_twitter/download_followers_7.py";
	};
    };


    # twitter_email 
    #----------------------------------------

    systemd.timers."twitter_email" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-01 07:30:00";
	    RandomizedDelaySec = "400";
	    Persistent = "true";
	    Unit = "twitter_email.service";
	};
    };

    systemd.services."twitter_email" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/Projects/scrape_twitter/email/send_analysis.sh";
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
	    User = "blair";
	    ExecStart = "/home/blair/Projects/scrape_wordpress/RUNALL.sh";
	};
    };


}
