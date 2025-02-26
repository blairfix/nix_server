{
    lib,
    stdenv,
    fetchurl,
    cups,
    dpkg,
    gnused,
    makeWrapper,
    ghostscript,
    coreutils,
    perl,
    gnugrep,
    which,
    debugLvl ? "0",
}:

let
version = "2.0.1-1";
version_lpr = "2.0.1-1";

lprdeb = fetchurl {
    url = "https://download.brother.com/welcome/dlf005841/brhl2040lpr-${version_lpr}.i386.deb";
    hash = "sha256-xPfbHxaujGEpAIorHeL0JZBky/9NTtZXJbguYfVEwtA=";
};

version_cups = "2.0.1-2";

cupsdeb = fetchurl {
    url = "https://download.brother.com/welcome/dlf005843/cupswrapperHL2040-${version_cups}.i386.deb";
    hash = "sha256-wyaRkiBNU6GmntvfQl+ITdWc7DBQUKAqdgcq6dKh1jw=";
};
in
stdenv.mkDerivation {
    pname = "cups-brother-hl2040";
    inherit version;

    nativeBuildInputs = [
	makeWrapper
	dpkg
    ];
    buildInputs = [
	cups
	ghostscript
	perl
    ];

    dontPatchELF = true;
    dontBuild = true;

    unpackPhase = ''
	mkdir -p $out
	dpkg-deb -x ${cupsdeb} $out
	dpkg-deb -x ${lprdeb} $out
	'';

    patchPhase = ''

	# Patch lpr
	BASE=/usr/local/Brother

	INFDIR=$out$BASE/inf
	LPDDIR=$out$BASE/lpd

	substituteInPlace $LPDDIR/filterHL2040 --replace-fail "$BASE" "$out$BASE"  

	patchelf --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
	$INFDIR/braddprinter
	patchelf --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
	$out/usr/bin/brprintconflsr2
	patchelf --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
	$LPDDIR/rawtobr2

	# Patch cupswrapper
	WRAPPER=$out$BASE/cupswrapper/cupswrapperHL2040-2.0.1

	substituteInPlace $WRAPPER --replace-fail "/usr" "$out/usr"
	substituteInPlace $WRAPPER --replace-fail "\$DEBUG=0;" "\$DEBUG=${debugLvl};"

	'';

    installPhase = ''

	mkdir -p $out/lib/cups/filter/

	makeWrapper \
	$WRAPPER \
	$out/lib/cups/filter/brother_lpdwrapper_HL2040 \
	--prefix PATH : ${
	    lib.makeBinPath [
		coreutils
		gnugrep
		gnused
	    ]
	}

    wrapProgram $LPDDIR/filterHL2040 \
	--prefix PATH ":" ${
	    lib.makeBinPath [
		ghostscript
		which
	    ]
	}
    '';

    meta = with lib; {
	homepage = "http://www.brother.com/";
	description = "Brother HL-2040 printer driver";
	sourceProvenance = with sourceTypes; [ binaryNativeCode ];
	license = licenses.unfree;
	platforms = [
	    "x86_64-linux"
	    "i686-linux"
	];
	downloadPage = "https://support.brother.com/g/b/downloadtop.aspx?c=ca&lang=en&prod=hl2040_all";
	maintainers = with maintainers; [ blairfix ];
    };
}


