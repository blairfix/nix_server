{ config, pkgs, ... }:
{

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

    systemd.services."social_email" = let
	python = pkgs.python3.withPackages (ppkgs: with ppkgs; [
		selenium
	]);

    in {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};

	path = with pkgs; [ 
	    bash
	    R
	];
	script = ''
	    bash /home/blair/Projects/scrape_twitter/email/send_analysis
	    '';
    };
}
