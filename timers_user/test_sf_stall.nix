{ config, pkgs, ... }:
{
    # test_sf_stall
    #----------------------------------------

    systemd.timers."test_sf_stall" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar="*:0/10";
	    Unit = "test_sf_stall.service";
	};
    };

    systemd.services."test_sf_stall" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    WorkingDirectory = "/home/blair/Projects/smart_find";
	};
	path = with pkgs; 

	let  R-with-my-packages = rWrapper.override{
            packages = with rPackages; [ 
		magrittr
	    ];
	};

	in [
	    bash
	    R-with-my-packages
	    ps
	];
	script = ''
	    bash /home/blair/Projects/smart_find/test_stall.sh
	    '';
    };
}


