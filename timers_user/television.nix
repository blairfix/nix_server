{ config, pkgs, ... }:
{

    # television rss
    #----------------------------------------

    systemd.timers."television" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*:0,15,30,45";
	    Unit = "television.service";
	};
    };

    systemd.services."television" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};
	path = with pkgs; [ 
	    bash
	    flexget
	    R
	];
	script = ''
	    bash /home/blair/Projects/television/runall.sh
	    '';

    };
}

