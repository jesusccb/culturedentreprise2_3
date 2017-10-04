Silvestre Jesus Ccorahua Balboa 


Projet de Culture d’entreprise






2.3 Using docker-compose
Pour lancer le projet taper:

$ docker-compose build --no-cache
$ docker-compose up

3 Setting up a development stack

Contexte

Installation d’un serveur Glassfish qui pourra déployer une application  web avec la technologie java SE ou EE , ou toute autre application avec les technologies mentionnées. 
Installation du serveur Mysql pour gérer des données 
Application 
Pas à réalisés:

Création des dockerfiles de l’image du serveur glassfish et mysql
Création du fichier docker-compose 

Pour lancer le projet taper

$ docker-compose build --no-cache
$ docker-compose up

test du bon lancement du serveur web glassfish :
entrer le lien suivant dans un navigateur web :

https://localhost:14848/
user:admin    
password:password

Structure du projet 

    exo3
    |
    |_______db_
    |               |
    |               |_______db-init-2.sh                  : création de la          
    |               |_______Docckerfile
    |               |_______NYCP_database.Derby.sql
    |         
    |________glassfish_
    |         |
    |         |______code
    |         |          |______ WebApplication1.war
    |         |          
    |         |______Dockerfile
    |         |______ mysql-connector-java-5.1.34.jar
    |         |______ glassfish_admin_password.txt
    |         |______  create-connection-with-db.sh
    |         |______ start-server.sh
    |
    |________ sharedFile
    |
    |________ docker-compose.yml
|
|________ readme.txt

Buts atteintes 

création du serveur glassfish
création du serveur mysql

Buts non-atteints 

connection du glassfish vers mysql (pool de connection non réalisé)
application web non déployé par glassfish ( problème du serveur )

Inconvénients rencontrés

création du pool réalisé ( dans le fichier start-server.sh ), mais inconvenient au lancement du docker-compose up 
solution : non exécution de ce fichier sinon juste de la commande pour lancer le serveur 


