FROM	continuumio/miniconda3

LABEL	maintainer="Stefano Ghignone, IPSP-CNR, Turin, Italy, stefano.ghignone[at]ipsp.cnr.it"
LABEL	name="PILON"
LABEL	description="Automatically improve draft assemblies and find variation among strains"
LABEL	version="1.23 (released 2018-11-27)" 

RUN	apt update && apt install -y procps && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN	conda update -n base -c defaults conda
RUN	conda config --add channels conda-forge && \
	conda config --add channels bioconda && \
	conda config --add channels default
	
	#INSTALL SOFTWARE
RUN	conda install pilon=1.23 && conda clean -a

	#TWEAK PILON
ENV     MINMEM="1g"
ENV     MAXMEM="100g"
RUN	sed -i "16s/Xms512m/Xms${MINMEM}/" /opt/conda/share/pilon-1.23-2/pilon && sed -i "16s/Xmx1g/Xmx${MAXMEM}/" /opt/conda/share/pilon-1.23-2/pilon

WORKDIR	/scratch
