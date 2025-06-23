{ config, pkgs, ... }:
{

    # bn archives backup email
    #----------------------------------------

    systemd.timers."bn_email" = {
	wantedBy = [ "timers.target" ];
	timerConfig = {
	    OnCalendar= "*-*-* 03:00:00";
	    Persistent = "true";
	    Unit = "bn_email.service";
	};
    };

    systemd.services."bn_email" = {
	serviceConfig = {
	    Type = "simple";
	    User = "root";
	    WorkingDirectory = "/home/blair/Projects/wp_bak/bn_email";
	};

	path = with pkgs;
	let  R-with-my-packages = rWrapper.override{
	    packages = with rPackages; [ 
		mailR
	    ];
	};

	in [ 
	    bash
	    borgbackup
	    gnutar
	    pigz
	    s3cmd
	    R-with-my-packages
	];
	script = ''
	    bash /home/blair/Projects/wp_bak/bn_email/runall.sh
	    '';
    };

}
