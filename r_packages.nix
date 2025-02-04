{ pkgs, ... }:
{
    environment.systemPackages = with pkgs;  

    let
	R-with-my-packages = rWrapper.override{ 
	    packages = with rPackages; [ 

		BH
		data_table
		doSNOW
		doParallel
		cowplot
		foreach
		ggrepel
		gridExtra
		gtable
		haven
		here
		lexicon
		magrittr
		stringi
		mailR
		microbenchmark
		oce
		osfr
		png
		pracma
		progress
		rlecuyer
		R_utils
		Rcpp
		RcppArmadillo
		RcppGSL
		RcppZiggurat
		scales
		snow
		VGAM
		xtable
		wordcloud2
		ggpubr
		qdapRegex
		fastmatch
		webshot
		RcppRoll
		ggcorrplot
		xlsx
		sf
		igraph
		tidygraph
		ggraph
		ggiraph
		roll
		poweRlaw
		magick
		truncnorm
		fuzzyjoin
		ppcor
		profvis


		#tidyverse 
		tidyverse
		tidyquant
		ggtext
		tm
		ngramr
		readxlsb

		
		# blair's packages
		(buildRPackage {
		 name = "bfstr";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfstr";
		 rev = "master";
		 sha256 = "sha256-3MT+tTQpcpoNbknadRf1QBPI0EXm3q+nMuL8GJ20bFM";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

		(buildRPackage {
		 name = "bfstat";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfstat";
		 rev = "master";
		 sha256 = "sha256-fuCCJZHZoXkVycMnHZ37HGd2wwetLbAVWryjBNeWSUc";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

		(buildRPackage {
		 name = "bfgg";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfgg";
		 rev = "master";
		 sha256 = "sha256-y2E8QYjiuHHVxgS+LXv5nYL8RBFDekD5nYgRdNZly7g";
		 };
		 propagatedBuildInputs = [ ggplot2 gridExtra data_table here ];
		 })

		(buildRPackage {
		 name = "hmod";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "hmod";
		 rev = "master";
		 sha256 = "sha256-XMMNUk5suFWxEnzvpy8BBMr/GGm1/RID0M055R+HRM0";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH RcppZiggurat data_table ];
		 })


	    ];
	};
    in [
	R-with-my-packages
    ];
}
