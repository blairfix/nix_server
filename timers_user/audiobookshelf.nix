{ config, pkgs, ... }:
{

    # audiobookshelf 
    #----------------------------------------

    systemd.timers."audiobookshelf" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnBootSec = "1 m";
	    Unit = "audiobookshelf.service";
	};
    };

    systemd.services."audiobookshelf" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};
	path = with pkgs; [ 
	    docker
	    docker-compose
	    bash
	];
	script = ''
	    bash /home/blair/cronjobs/active/audio_bookshelf_start
	    '';
    };

}
