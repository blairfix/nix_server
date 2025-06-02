{ config, pkgs, ... }:
{
    # smartfind
    #----------------------------------------

    systemd.timers."smartfind" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*:0,5,10,15,20,25,30,35,40,45,50,55";
	    Unit = "smartfind.service";
	};
    };

    systemd.services."smartfind" = let
	python = pkgs.python3.withPackages (ppkgs: with ppkgs; [
		selenium
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
		data_table
		magrittr
	    ];
	};

	in [
	    bash
	    python
	    R-with-my-packages
	    firefox
	    ps
	];
	script = ''
	    bash /home/blair/Projects/smart_find/is_smartfind_running.sh
	    '';
    };
}


