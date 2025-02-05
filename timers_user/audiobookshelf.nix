{ config, ... }:
{

    # audiobookshelf 
    #----------------------------------------

    systemd.user.timers."audiobookshelf" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "audiobookshelf.service";
	};
    };

    systemd.user.services."audiobookshelf" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart = "/home/blair/cronjobs/active/audio_bookshelf_start";

	};
    };

}
