{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;  [ 

	( python3.withPackages( ps: with ps; [ 

		# compute
		pandas 
		datetime
		tqdm
		imutils

		# markdown readme previews
		#grip

		# scraping
		selenium

		# r console
		radian

		# linode
		#boto

		# ssl
		requests 
		cryptography

		# audio
		eyeD3

	    ]))
    ];
}
