{ config, pkgs, ... }:
{

    # raid email
    #----------------------------------------

    systemd.timers."raid_email" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 09:45:00";
	    Persistent = "true";
	    Unit = "raid_email.service";
	};
    };

    systemd.services."raid_email" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    WorkingDirectory = "/home/blair/Projects/raid_status/";
	};

	path = with pkgs; [ 
	    bash
	    R
	];
	script = ''
	    bash /home/blair/Projects/raid_status/run.sh
	    '';
    };
}


