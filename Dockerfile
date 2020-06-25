FROM	continuumio/miniconda3

LABEL	maintainer="Stefano Ghignone, IPSP-CNR, Turin, Italy, stefano.ghignone[at]ipsp.cnr.it"
LABEL	name="BOWTIE2"
LABEL	description="Fast and sensitive read alignment"
LABEL	version="2.4.1 (Feb 28, 2020)" 

RUN	apt update && apt install -y procps && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN	conda update -n base -c defaults conda
RUN	conda config --add channels conda-forge && \
	conda config --add channels bioconda && \
	conda config --add channels default
	
	#INSTALL SOFTWARE
RUN	conda install bowtie2=2.4.1 && conda clean -a

WORKDIR	/scratch
