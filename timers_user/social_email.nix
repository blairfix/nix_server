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

	path = with pkgs;
	let  R-with-my-packages = rWrapper.override{
	    packages = with rPackages; [ 

		lubridate
		scales
		magrittr
		here
		data_table
		mailR

		(buildRPackage {
		 name = "bfgg";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfgg";
		 rev = "master";
		 sha256 = "sha256-y2E8QYjiuHHVxgS+LXv5nYL8RBFDekD5nYgRdNZly7g";
		 };
		 propagatedBuildInputs = [ ggplot2 gridExtra data_table here ];
		 })


	    ];
	};



	in [ 
	    bash
	    R-with-my-packages
	];
	script = ''
	    bash /home/blair/Projects/scrape_twitter/email/send_analysis.sh
	    '';
    };
}


