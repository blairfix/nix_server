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
	device = "/dev/disk/by-uuid/UUID=f8d56395-fc2e-4add-8bc0-af96159f068e";
	fsType = "ext4";
    };

    # backup drive
    fileSystems."/media/blair/Backup_drive" =
    { 
	device = "/dev/disk/by-uuid/UUID=e8b1525a-fd36-4590-9c27-efb926306b01";
	fsType = "ext4";
    };

}
