# image de base
FROM python:2.7-stretch
MAINTAINER lsniryniry (adrianajade.erin@gmail.com)
# mettre à jour le container et installer les dépendances
RUN apt-get update -y && apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y
# installation de flask
RUN pip install flask==1.1.2 flask_httpauth==4.1.0 flask_simpleldap python-dotenv==0.14.0
# creation de l'user 'appuser'
RUN groupadd -r appuserr && useradd -r -g appuserr appuserr
# Switch to 'appuserr'
USER appuserr
# copier le fichier python dans la racine
COPY student-list/simple_api/student_age.py /
# creation du dossier data
#RUN chmod 777 .
#RUN mkdir /data
# definition du volume
VOLUME ["/data"]
# exposition du port 5000
EXPOSE 5000
# lancement de la commande au lancement du container
CMD [ "python", "./student_age.py" ]
