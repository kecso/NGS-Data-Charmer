# some used packages do not have an arm64 variant, so the image
# must be built for specific target platform
# use switch --platform linux/amd64
FROM continuumio/anaconda3

WORKDIR /ngs-data-charmer

ADD . /ngs-data-charmer/

RUN conda env create -f environment.yaml

RUN curl -JLO https://genome-idx.s3.amazonaws.com/hisat/mm10_genome.tar.gz

RUN mkdir input
