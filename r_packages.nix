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
		#fuzzyjoin
		ppcor
		profvis
		matrixStats
		latex2exp
		rnaturalearth
		countrycode

		#tidyverse 
		tidyverse
		tidyquant
		ggtext
		tm
		ngramr
		#readxlsb


		# bfgg
		(buildRPackage {
		 pname = "bfgg";
		 version = "0.1";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfgg";
		 rev = "master";
		 sha256 = "sha256-gFm7i4JutDdUrbd8DYo1fdpZDDoIC1ucivy/co3cT0w=";
		 };
		 propagatedBuildInputs = [ ggplot2 gridExtra data_table here ];
		 })

		# bfread
		(buildRPackage {
		 pname = "bfread";
		 version = "0.1";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfread";
		 rev = "master";
		 sha256 = "sha256-tcqDT1Ew15V6a3tZim/HlbFGXOMuMUJakOavduUfOto=";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

		# bfstat
		(buildRPackage {
		 pname = "bfstat";
		 version = "0.1";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfstat";
		 rev = "master";
		 sha256 = "sha256-fixnyiU22NeiB+vAg+1+/Y20pPn7udbtLm0awVzkjzY=";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

		# bfstr
		(buildRPackage {
		 pname = "bfstr";
		 version = "0.1";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "bfstr";
		 rev = "master";
		 sha256 = "sha256-AAYmACx20J+k+c0FHo6KJZGyVgTC/cHCyq0UHj5Sn5g=";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })
		
		# hmod
		(buildRPackage {
		 pname = "hmod";
		 version = "0.1";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "hmod";
		 rev = "master";
		 sha256 = "sha256-A9jW/sFggYCjjRDzfbCBPC2dPLnoB6KvtRH+CnY+DsQ=";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH RcppZiggurat data_table ];
		 })

		# hubbert
		(buildRPackage {
		 pname = "hubbert";
		 version = "0.1";
		 src = fetchFromGitHub {
		 owner = "blairfix";
		 repo = "hubbert";
		 rev = "master";
		 sha256 = "sha256-jmaEq9b19UnPrJIWXSq51SL5Sneq1FRE8IA0t30Ek6k=";
		 };
		 propagatedBuildInputs = [ Rcpp RcppArmadillo BH ];
		 })

	    ];
	};
    in [
	R-with-my-packages
    ];
}
