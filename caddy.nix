{ config, pkgs, ... }:
{

services.caddy = {
    enable = true;
    extraConfig =
	''

	http://fix-jellyfin.com {
	    reverse_proxy 127.0.0.1:8096
	}

	http://fix-audiobooks.com {
	    reverse_proxy 127.0.0.1:13378
	}

	http://fix-photos.com {
	    reverse_proxy 127.0.0.1:2342
	}

	http://fix-books.com {
	    reverse_proxy 127.0.0.1:25600
	}

	http://fix-recipes.com {
	    reverse_proxy 127.0.0.1:9925
	}

	'';
};

}
