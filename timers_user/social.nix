{ config, pkgs, ... }:
{

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

    systemd.services."social_scrape" = let
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
	    python
	    R
	    firefox
	];
	script = ''
	    bash /home/blair/cronjobs/active/scrape_social
	    '';
    };
}
