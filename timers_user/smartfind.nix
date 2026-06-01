{ config, pkgs, ... }:
{
    # smartfind
    #----------------------------------------

    systemd.timers."smartfind" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar="*-*-* *:*:00";
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
	    WorkingDirectory = "/home/blair/Projects/smart_find";
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


