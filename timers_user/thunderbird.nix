{ config, pkgs, ... }:
{

    # thunderbird 
    #----------------------------------------

    systemd.timers."thunderbird" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "hourly";
	    Unit = "thunderbird.service";
	};
    };

    systemd.services."thunderbird" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};
	path = with pkgs; [ 
	    bash
	    thunderbird
	];
	script = ''
	    bash /home/blair/cloud_work/timesheet/thunderbird_sync.sh
	    '';
    };
}
