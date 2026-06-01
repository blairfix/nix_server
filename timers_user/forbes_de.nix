{ config, pkgs, ... }:
{

    # raid email
    #----------------------------------------

    systemd.timers."forbes_de" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 21:38:00";
	    Persistent = "true";
	    Unit = "forbes_de.service";
	};
    };

    systemd.services."forbes_de" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    WorkingDirectory = "/home/blair/Projects/forbes/scrape_forbes_de/";
	};

	path = with pkgs;
	let  R-with-my-packages = rWrapper.override{
	    packages = with rPackages; [
		here
		magrittr

	    (buildRPackage {
	     name = "bfstr";
	     src = fetchFromGitHub {
	     owner = "blairfix";
	     repo = "bfstr";
	     rev = "master";
	     sha256 = "sha256-oZCUpxnmagSWB247c9fHAArgVOIPGnZqHucuuCUM9kE";
	     };
	     propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
	     })

	    ];
	};

	in [
	    bash
		R-with-my-packages
	];
	script = ''
	    bash /home/blair/Projects/forbes/scrape_forbes_de/runall.R
	    '';
    };
}
