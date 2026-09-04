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
	     pname = "bfstr";
	     version = "0.1";
	     src = fetchFromGitHub {
	     owner = "blairfix";
	     repo = "bfstr";
	     rev = "master";
	     sha256 = "sha256-fixnyiU22NeiB+vAg+1+/Y20pPn7udbtLm0awVzkjzY=";
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
