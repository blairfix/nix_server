{ config, pkgs, ... }:
{

    # rclone
    #----------------------------------------

    systemd.timers."rclone" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "00/4:10";
	    RandomizedDelaySec = "60";
	    Persistent = "true";
	    Unit = "rclone.service";
	};
    };

    systemd.services."rclone" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};
	path = with pkgs; [
	    bash
	    rclone
	];
	script = ''
	    bash /home/blair/cronjobs/active/rclone
	    '';
    };
}
