{ config, pkgs, ... }:
{

    # imap 
    #----------------------------------------

    systemd.timers."imap" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "hourly";
	    Persistent = "true";
	    Unit = "imap.service";
	};
    };

    systemd.services."imap" = let
	python = pkgs.python3.withPackages (ppkgs: with ppkgs; [
		imap-tools
	]);
    in {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};
	path = with pkgs; [ 
	    python
	];
	script = ''
	    python /home/blair/Projects/imap_tools/sync.py
	    '';
    };

}
