# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
    imports =
	[ (modulesPath + "/installer/scan/not-detected.nix")
	];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "nvme" "usbhid" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    # root
    fileSystems."/" =
    { 
	device = "/dev/disk/by-uuid/d1889f4c-4279-4d17-a332-b3219581ab2f";
	fsType = "ext4";
    };

    # home
    fileSystems."/home" =
    { 
	device = "/dev/disk/by-uuid/c18c0719-c196-4acd-a155-947e6262b933";
	fsType = "ext4";
    };

    # media
    fileSystems."/media/blair/multimedia" =
    { 
	device = "/dev/disk/by-uuid/a37ed80a-8cab-4b8c-b944-2208ecffac28";
	fsType = "ext4";
    };

    # backup 1
    fileSystems."/media/blair/backup1" =
    { 
	device = "/dev/disk/by-uuid/e8b1525a-fd36-4590-9c27-efb926306b01";
	fsType = "ext4";
    };

    # backup 2
    fileSystems."/media/blair/backup2" =
    { 
	device = "/dev/disk/by-uuid/21254a06-b297-4d84-93e3-eb60dfc79e27";
	fsType = "ext4";
    };

    # no swap
    swapDevices = [ ];

    # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
    # (the default) this is the recommended approach. When using systemd-networkd it's
    # still possible to use this option, but it's recommended to use it in conjunction
    # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.

    networking.useDHCP = lib.mkDefault true;
    # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
    # networking.interfaces.enp3s0.useDHCP = lib.mkDefault true;
    # networking.interfaces.tailscale0.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
