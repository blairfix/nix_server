{ config, ... }:
{

    # thunderbird 
    #----------------------------------------

    systemd.user.timers."thunderbird" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "hourly";
	    Unit = "thunderbird.service";
	};
    };

    systemd.user.services."thunderbird" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart="/home/blair/cloud_work/timesheet/thunderbird_sync.sh";
	};
    };

}
