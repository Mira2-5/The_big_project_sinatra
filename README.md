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
├── config.ru                  # Fichier de configuration pour Rack
├── Gemfile                   # Fichier de déclaration des gems
├── Gemfile.lock              # Versions figées des gems
│
├── db/
│   ├── gossips.csv           # Base de données CSV des potins
│   └── comments.csv          # Base de données CSV des commentaires
│
└── lib/
    ├── controller.rb         # Contrôleur principal de l'application
    ├── gossip.rb             # Classe Gossip (CRUD sur les potins)
    ├── comment.rb            # Classe Comment (CRUD sur les commentaires)
    │
    └── views/
        ├── index.erb         # Page d’accueil avec tous les potins
        ├── new_gossip.erb    # Formulaire de création d’un potin
        ├── show.erb          # Affichage d’un potin avec ses commentaires
        ├── edit.erb          # Formulaire de modification d’un potin

        
