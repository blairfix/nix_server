{ config, pkgs, ... }:
{

    # wp_bak
    #----------------------------------------

    systemd.timers."wp_bak" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 04:28:00";
	    RandomizedDelaySec = "60";
	    Persistent = "true";
	    Unit = "wp_bak.service";
	};
    };

    systemd.services."wp_bak" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};
	path = with pkgs; [
	    bash
	    rclone
	];
	script = ''
	    bash /home/blair/cronjobs/active/wp_bak
	    '';
    };
}
