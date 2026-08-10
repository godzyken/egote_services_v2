/// TYPE	        Prix minimum au m² /	Prix maximum au m²
library;
//  Brique	      100 € /	150 €
//  Bois double	  125 € /	375 €
//  Métal	        125 € /	175 €
//  Parpaing	    250 € /	500 €

//  Prix hors eau, hors air, gros œuvre achevé
//  Ces tarifs sont exprimés en Euros, toutes taxes comprises (TTC). Ils sont issus de moyennes de prix de divers sites internet de construction.

enum TypeOfElements {
  briques,
  boisDouble,
  metal,
  parpaing
}

extension TypeOfElementsExtension on TypeOfElements {
  double get minPrice {
    switch (this) {
      case TypeOfElements.briques: return 100.0;
      case TypeOfElements.boisDouble: return 125.0;
      case TypeOfElements.metal: return 125.0;
      case TypeOfElements.parpaing: return 250.0;
    }
  }

  double get maxPrice {
    switch (this) {
      case TypeOfElements.briques: return 150.0;
      case TypeOfElements.boisDouble: return 375.0;
      case TypeOfElements.metal: return 175.0;
      case TypeOfElements.parpaing: return 500.0;
    }
  }
  
  String get label {
    switch (this) {
      case TypeOfElements.briques: return "Brique";
      case TypeOfElements.boisDouble: return "Bois double";
      case TypeOfElements.metal: return "Métal";
      case TypeOfElements.parpaing: return "Parpaing";
    }
  }
}
