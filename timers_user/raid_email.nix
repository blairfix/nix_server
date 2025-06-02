{ config, pkgs, ... }:
{

    # raid email
    #----------------------------------------

    systemd.timers."raid_email" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-16 02:41:00";
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

	path = with pkgs;
	let  R-with-my-packages = rWrapper.override{
	    packages = with rPackages; [ 
		here
		mailR
	    ];
	};

	in [ 
	    bash
	    R-with-my-packages
	];
	script = ''
	    bash /home/blair/Projects/raid_status/run.sh
	    '';
    };
}


