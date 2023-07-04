FROM continuumio/anaconda3:4.4.0
MAINTAINER UNP, https://unp.education
EXPOSE 5000



WORKDIR /home/workspace/production_test/

RUN conda install numpy
RUN conda install scikit-learn



COPY CI_and_CD/src/ /home/workspace/production_test/
CMD python3 inference.py