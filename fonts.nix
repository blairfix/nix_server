{ pkgs, ... }:
{

    # fonts
    fonts.packages = with pkgs; [

	freefont_ttf
	noto-fonts 
	dejavu_fonts
	ubuntu_font_family 
	liberation_ttf
	font-awesome
	roboto
	wine64Packages.fonts

    ];
}
