{ config, pkgs, ... }:
{

    # internet_archive 
    #----------------------------------------

    systemd.timers."internet_archive" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*-*-04 11:00:00";

	    Persistent = "true";
	    Unit = "internet_archive.service";
	};
    };

    systemd.services."internet_archive" = let
	python = pkgs.python3.withPackages (ppkgs: with ppkgs; [

		internetarchive 
		pandas 
		datetime

	]);

    in {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    WorkingDirectory = "/home/blair/Projects/internet_archive";
	};

	path = with pkgs;
	let  R-with-my-packages = rWrapper.override{
	    packages = with rPackages; [ 

		magrittr
		here
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
		 sha256 = "sha256-fixnyiU22NeiB+vAg+1+/Y20pPn7udbtLm0awVzkjzY=";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

	    ];
	};

	in  [ 
	    bash
	    python
	    wget
	    R-with-my-packages 
	];
	script = ''
	    bash /home/blair/Projects/internet_archive/runall.sh
	    '';
    };

}
