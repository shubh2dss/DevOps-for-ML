FROM continuumio/anaconda3:4.4.0
MAINTAINER UNP, https://unp.education
EXPOSE 5000



WORKDIR /home/workspace/GIT-ML-ENDTOEND/shubh2dss-GIT/CICD-Testing/

RUN conda install numpy
RUN conda install scikit-learn



COPY CI_and_CD/src/ /home/workspace/GIT-ML-ENDTOEND/shubh2dss-GIT/CICD-Testing/
CMD python3 inference.py