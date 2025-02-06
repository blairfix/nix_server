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
	]);
    in {


	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};
	path = with pkgs; [
	    bash
	    python
	    R
	    firefox
	    datetime
	];
	script = ''
	    bash /home/blair/cloud_work/smart_find/is_smartfind_running.sh
	    '';`
    };
}
