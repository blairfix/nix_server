{ config, pkgs, ... }:
{

    # forbes 
    #----------------------------------------

    systemd.timers."forbes" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 21:38:00";
	    AccuracySec= "1sec";
	    Persistent = "true";
	    Unit = "forbes.service";
	};
    };

    systemd.services."forbes" = let
	python = pkgs.python3.withPackages (ppkgs: with ppkgs; [
		selenium
	]);

    in {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};

	path = with pkgs;
	let  R-with-my-packages = rWrapper.override{
            packages = with rPackages; [ 
		data_table
		here
		lubridate
		magrittr
		mailR
	    ];
	};

	 in  [ 
	    bash
	    python
	    R-with-my-packages 
	    firefox
	];
	script = ''
	    bash /home/blair/cloud_work/empirical_research/scrape_forbes/run.sh
	    '';
    };

}
