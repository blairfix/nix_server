{ config, ... }:
{

    # home
    fileSystems."/home" =
    { 
	device = "/dev/disk/by-uuid/UUID=c18c0719-c196-4acd-a155-947e6262b933";
	fsType = "ext4";
    };

    # multimedia
    fileSystems."/media/blair/multimedia" =
    { 
	device = "/dev/disk/by-uuid/UUID=a37ed80a-8cab-4b8c-b944-2208ecffac28";
	fsType = "ext4";
    };

    # backup drive
    fileSystems."/media/blair/Backup_drive" =
    { 
	device = "/dev/disk/by-uuid/UUID=e8b1525a-fd36-4590-9c27-efb926306b01";
	fsType = "ext4";
    };

}
