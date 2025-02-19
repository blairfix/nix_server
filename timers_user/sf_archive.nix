{ config, pkgs, ... }:
{
    # sf_archive archive
    #----------------------------------------

    systemd.timers."sf_archive" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar = "weekly";
	    #OnCalendar = "*-*-*  *:04:00";
	    Persistent = "true";
	    Unit = "sf_archive.service";
	};
    };

    systemd.services."sf_archive" = {
	serviceConfig = {
	    Type = "simple";
	    User = "blair";
	};
	path = with pkgs; [
	    bash
	    trash-cli
	    gnutar
	    xz
	];
	script = ''
	    bash /home/blair/cloud_work/smart_find/make_archive.sh
	    '';
    };
}
