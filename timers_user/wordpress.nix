{ config, pkgs, ... }:
{

    # wordpress_scrape 
    #----------------------------------------

    systemd.timers."wordpress_scrape" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-03 04:48:00";
	    RandomizedDelaySec = "1";
	    Persistent = "true";
	    Unit = "wordpress_scrape.service";
	};
    };

    systemd.services."wordpress_scrape" = let
	python = pkgs.python3.withPackages (ppkgs: with ppkgs; [
		selenium
		pandas
		datetime
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
	    bash /home/blair/Projects/scrape_wordpress/RUNALL.sh
	    '';
    };
}


