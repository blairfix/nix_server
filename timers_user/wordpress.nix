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

	path = with pkgs; 

	let  R-with-my-packages = rWrapper.override{
	    packages = with rPackages; [ 

		here
		lubridate
		mailR
		scales

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
	    python
	    R-with-my-packages
	    firefox
	];
	script = ''
	    bash /home/blair/Projects/scrape_wordpress/RUNALL.sh
	    '';
    };
}


