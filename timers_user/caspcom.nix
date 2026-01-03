{ config, pkgs, ... }:
{

    # caspcom 
    #----------------------------------------

    systemd.timers."caspcom" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-* 06:30:00";

	    Persistent = "true";
	    Unit = "caspcom.service";
	};
    };

    systemd.services."caspcom" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    WorkingDirectory = "/home/blair/cloud_work/github/caspcom/scrape/scripts";
	};

	path = with pkgs;
	let  R-with-my-packages = rWrapper.override{
	    packages = with rPackages; [ 

		magrittr
		stringr
		data_table
		stringi
		stringr

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

	in  [ 
	    bash
	    wget
	    rsync
	    sshpass
	    openssh
	    R-with-my-packages 
	];
	script = ''
	    bash /home/blair/cloud_work/github/caspcom/scrape/scripts/runall.sh
	    '';
    };

}
