{ config, ... }:
{
    # scrape smartfind
    #----------------------------------------

    systemd.user.timers."smartfind" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "*:0,5,10,15,20,25,30,35,40,45,50,55"
	    Unit = "smartfind.service";
	};
    };

    systemd.user.services."smartfind" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	    ExecStart= "/home/blair/cloud_work/smart_find/is_smartfind_running.sh";
	};
    };
}
