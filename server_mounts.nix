{ config, ... }:
{

    fileSystems."/media/blair/multimedia" =
    { device = "/dev/disk/by-uuid/UUID=a2352a98-821a-4ae4-8a10-a3228d356da5";
	fsType = "ext4";
    };

    fileSystems."/media/blair/Backup_drive" =
    { device = "/dev/disk/by-uuid/UUID=a2352a98-821a-4ae4-8a10-a3228d356da5";
	fsType = "ext4";
    };

}
