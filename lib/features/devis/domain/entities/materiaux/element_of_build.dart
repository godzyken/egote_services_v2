/// TYPE	        Prix minimum au m² /	Prix maximum au m²
//  Brique	      100 € /	150 €
//  Bois double	  125 € /	375 €
//  Métal	        125 € /	175 €
//  Parpaing	    250 € /	500 €
// TODO: integrer la logique
//  Prix hors eau, hors air, gros œuvre achevé
//  Ces tarifs sont exprimés en Euros, toutes taxes comprises (TTC). Ils sont issus de moyennes de prix de divers sites internet de construction.

enum TypeOfElements {
  briques,
  boisDouble,
  metal,
  parpaing
}

/*
enum CostMinOfElements {
  100,
  125,
  125,
  250
}


enum CostMaxOfElements {
  150,
  375,
  175,
  500,
}*/

///Petits travaux de maçonnerie
// Construction garage
// Escaliers
// Sciage et carottage (ouverture dans un mur)
// Construction maison
// Rénovation appartement, maison (et autres bâtiments)
// Extension maison
// Aménagement d'intérieur
// Gros oeuvre
// Terrassement
// Remontée capillaire / Traitement de l'humidité
// Aménagement de combles
// Architecte (projet de rénovation, construction)
// Traitement de façade
// Surélévation
// Maître d'oeuvre
// Construction immeuble
// Fondation
// Verrière
// Bureau d'études - Ingénierie
// Bureau d'expertise - Expert en bâtiment
// Cheminée
// Viabilisation (raccordements égout, eau, électricité...)
// Agencement commerce
// Conduits de cheminée
// Création d'une mezzanine
// Ravalement de façade
// Aménagements pour pers. à mobilité réduite
// Nettoyage de façade
// Enrochement
// Installer ou reconstruire une cheminée
// Monuments funéraires - Pierres tombales
// Réparation ou entretien de cheminée
// Traitement de l'eau
// Bardage


/// TYPE	              Prix minimum au m² /  Prix maximum au m²
// Peinture intérieure
//            Acrylique	            1 €	/ 5 €
//            Vinylique	            1 €	/ 5 €
//            Glycéro	              2 €	/ 5 €


// Peinture extérieure (façade, balcon...)
//            Acrylique	            0 € /	4 €
//      Mono spéciale fissure	      1 € /	2 €
//            Pliolite	            1 € /	2 €
//            Hydropliolite	        1 €	/ 4 €
//            Siloxilane	          1 €	/ 5 €


///	TYPE              Prix minimum au m² / Prix moyen au m² /	Prix maximum au m²
// Papier peint
//            Vinyle	              1 €	/ 5 €	/ 11 €
//            Papier	              0 €	/ 3 € / 8 €
//            Intissé	              1 €	/ 6 €	/ 12 €
// Photos/Posters muraux (à l'unité) 15 € /	75 € /	130 €
//            Pose	                7 €	/ 12 €	/ 18 €
//        Total fournitures et pose	7 €	/ 17 €	/ 30 €
//
//            Décollage (au m²)	    6 €	/ 8 €	/ 9 €

// Peinture décorative
//    Moulure en polystyrène	      1 € /	4 € /	6 €
//    Moulure en polymère	          3 € /	4 € /	5 €
//    Moulure en polyuréthane	      6 € /	7 € /	9 €
//    Moulure en bois	              0 € /	2 € /	9 €
//    Moulure en MDF	              1 € /	2 € /	3 €
//    Pose d'une moulure (hors staff, au ml)	          4 € /	9 € /	25 €
//    Total fournitures & pose (hors staff, au ml)	    4 € /	13 € /	34 €
//    Fourniture & pose d'une moulure en staff (au ml)	21 € /	39 € /	58 €

// Peindre une porte intérieure
// Peindre un plafond
// Peindre un carrelage
// Peindre un mur
// Peindre un carrelage de cuisine
// Peindre une fenêtre pvc
// Lambris


// Plomberie (neuf et rénovation)
// Petits travaux de plomberie
// Chauffe-eau
// Canalisation (nettoyage, curage, débouchage)
// Canalisation (pose, remplacement, réparation)
// Fosse septique - Bac à graisse (installation, remplacement)
// Mini station d'épuration

// Installation baignoire balnéo, SPA et bien-être

// Installation douche
// Type                     Prix minimum /	Prix moyen	/ Prix maximum
//    Combiné bain-douche	            550 € /	2800 € /	6900 €
//    Receveur	                      30 € /	350 € /	640 €
//    Robinet	                        10 € /	100 € /	250 €
//    Colonne	                        35 € /	320 € /	800 €
//    Cabine	                        200 € /	830 € /	1250 €
//    Main-d'œuvre	                  280 € /	480 € /	900 €
//    Total fournitures & pose	      320 € /	1150 € /	7800 €
//    Faïence (fourniture et pose, au m²)	24 € /	87 € /	150 €
//    Paroi vitrée (fourniture et pose)	300 € /	850 € /	1700 €


// Fosse septique - Bac à graisse (vidange, entretien)
// Drainage
// Adoucisseur d'eau
// Brumisateur
// Réparation de fuite
// Fontaine d'eau