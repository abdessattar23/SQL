CREATE DATABASE itthink;

USE itthink;

CREATE TABLE categories (
  id_categorie int PRIMARY KEY AUTO_INCREMENT,
  nom_categorie varchar(25)
);

CREATE TABLE utilisateurs (
  id_utilisateur int PRIMARY KEY AUTO_INCREMENT,
  nom_utilisateur varchar(25),
  mot_de_passe varchar(25),
  email varchar(25)
);

CREATE TABLE freelances (
  id_freelance int PRIMARY KEY AUTO_INCREMENT,
  nom_freelance varchar(25),
  competences varchar(100),
  id_utilisateur int,
  FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);

CREATE TABLE souscategorie (
  id_sous_categorie int PRIMARY KEY AUTO_INCREMENT,
  nom_sous_categorie varchar(25),
  id_categorie int,
  FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie)
);

CREATE TABLE projets (
  id_projet int PRIMARY KEY AUTO_INCREMENT,
  titre_projet varchar(25),
  description varchar(25),
  id_categorie int,
  id_sous_categorie int,
  id_utilisateur int,
  FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie),
  FOREIGN KEY (id_sous_categorie) REFERENCES souscategorie(id_sous_categorie),
  FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);

CREATE TABLE offres (
  id_offre int PRIMARY KEY AUTO_INCREMENT,
  montant int,
  delai int,
  id_utilisateur int,
  id_freelance int,
  id_projet int,
  FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur),
  FOREIGN KEY (id_freelance) REFERENCES freelances(id_utilisateur),
  FOREIGN KEY (id_projet) REFERENCES projets(id_projet)
);

CREATE TABLE temoignages (
  id_temoignage int PRIMARY KEY AUTO_INCREMENT,
  commentaire varchar(100),
  id_utilisateur int,
  FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
);


ALTER TABLE utilisateurs ADD date_creation date;


INSERT INTO categories (id_categorie, nom_categorie) VALUES
(1, 'Finance');

INSERT INTO utilisateurs (id_utilisateur, nom_utilisateur, mot_de_passe, email) VALUES
(1, 'abdel droid', 'password-hashed', 'abc@gmail.com');

INSERT INTO freelances (id_freelance, nom_freelance, competences, id_utilisateur) VALUES
(1, 'Freelancer 1', 'Web developpment', 1);

INSERT INTO souscategorie (id_sous_categorie, nom_sous_categorie, id_categorie) VALUES
(1, 'Bank', 1);

INSERT INTO projets (id_projet, titre_projet, description, id_categorie, id_sous_categorie, id_utilisateur) VALUES
(1, 'ERP de bank', 'ERP System de notre bank', 1, 1, 1);

INSERT INTO offres (id_offre, montant, delai, id_utilisateur, id_freelance, id_projet) VALUES
(1, 600, 1752444556, 1, 1, 1);

INSERT INTO temoignages (id_temoignage, commentaire, id_utilisateur) VALUES
(1, 'Tres bon freelancer', 1);
INSERT INTO temoignages (id_temoignage, commentaire, id_utilisateur) VALUES
(2, 'Nicee Work', 1);


UPDATE utilisateurs SET date_creation = "2024-12-11" WHERE id_utilisateur = 1;


DELETE FROM temoignages WHERE id_temoignage = 1;

SELECT * FROM projets JOIN categories ON projets.id_categorie = categories.id_categorie;