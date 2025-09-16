Projet Gossip - Application de Potins en Sinatra

Ce projet est une application web simple de potins ("Gossip") développée avec le framework Sinatra en Ruby. Elle permet aux utilisateurs de :

.Consulter la liste des potins publiés.

.Créer un nouveau potin.

.Voir les détails d’un potin spécifique.

.Modifier un potin existant.

.Supprimer un potin.

.Ajouter des commentaires à un potin.

Toutes les données (potins et commentaires) sont stockées dans des fichiers CSV.

  Fonctionnalités

.Page d’accueil : liste tous les potins avec leur auteur et contenu.

.Création de potins : formulaire pour ajouter un nouveau potin.

.Affichage d’un potin : détail complet avec ses commentaires.

.Modification : interface pour éditer le contenu et l’auteur d’un potin.

.Suppression : suppression d’un potin et de ses commentaires associés.

.Commentaires : ajout de commentaires à chaque potin.

Structure du projet :

the_big_project_sinatra/
│
├── config.ru                  
├── Gemfile                  
├── Gemfile.lock              
│
├── db/
│   ├── gossips.csv           
│   └── comments.csv          
│
└── lib/
    ├── controller.rb         
    ├── gossip.rb            
    ├── comment.rb            
    │
    └── views/
        ├── index.erb         
        ├── new_gossip.erb    
        ├── show.erb         
        ├── edit.erb         
