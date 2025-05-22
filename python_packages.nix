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
	    internetarchive

	    # r console
	    radian

	    # linode
	    boto3

	    # ssl
	    requests 
	    cryptography

	    # audio
	    eyeD3

	    # download
	    transmission-rpc

	    # calenar
	    caldav

	    # translate
	    deep-translator

	    # email
	    imap-tools

	    ]))
    ];
}
