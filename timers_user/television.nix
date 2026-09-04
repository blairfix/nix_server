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

	path = with pkgs; 

	let  R-with-my-packages = rWrapper.override{
	    packages = with rPackages; [ 

		data_table
		here
		magrittr
		stringr

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
	    flexget
	    R-with-my-packages
	];
	script = ''
	    bash /home/blair/Projects/television/runall.sh
	    '';

    };
}

