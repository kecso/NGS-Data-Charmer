# some used packages do not have an arm64 variant, so the image
# must be built for specific target platform
# use switch --platform linux/amd64
FROM continuumio/anaconda3

WORKDIR /ngs-data-charmer

ADD . /ngs-data-charmer/

#RUN curl -JLO https://genome-idx.s3.amazonaws.com/hisat/mm10_genome.tar.gz
RUN tar -xvf mm10_genome.tar.gz
RUN rm mm10_genome.tar.gz
RUN mkdir input

RUN mv -f config.docker.yaml config.yaml

RUN conda env create -f environment.yaml
RUN conda init bash
#RUN conda activate ngs_data_charmer