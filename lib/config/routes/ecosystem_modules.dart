import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/chantier/chantier_module.dart';
import '../../features/devis/presentation/views/screens/devis_list_screen.dart';
import 'app_module.dart';

/// Registry of all ecosystem modules for the Construction 4.0 Mosaic Hub
class EcosystemRegistry {
  static List<AppModule> get modules => [
    ChantierModule(),
    LeadsModule(),
    ArtisansModule(),
    Compta4meModule(),
    SketchMyWishesModule(),
    AtelierModule(),
    OutilsModule(),
  ];
}

class LeadsModule extends AppModule {
  @override
  String get id => 'leads';

  @override
  String get name => 'Leads';

  @override
  String get description => 'Génération et suivi des opportunités BTP';

  @override
  IconData get icon => Icons.trending_up;

  @override
  Color get accentColor => Colors.green;

  @override
  int get sortOrder => 2;

  @override
  bool get isPinnedByDefault => true;

  @override
  String get initialRoute => '/devisList';

  @override
  List<RouteBase> get routes => [];
}

class ArtisansModule extends AppModule {
  @override
  String get id => 'artisans';

  @override
  String get name => 'Artisans';

  @override
  String get description => 'Réseau, compétences et scoring artisans';

  @override
  IconData get icon => Icons.people_alt_outlined;

  @override
  Color get accentColor => Colors.purple;

  @override
  int get sortOrder => 3;

  @override
  bool get isPinnedByDefault => true;

  @override
  String get initialRoute => '/artisans';

  @override
  List<RouteBase> get routes => [];
}

class Compta4meModule extends AppModule {
  @override
  String get id => 'compta4me';

  @override
  String get name => 'Compta4me';

  @override
  String get description => 'Facturation, devis et comptabilité chantier';

  @override
  IconData get icon => Icons.receipt_long;

  @override
  Color get accentColor => Colors.teal;

  @override
  int get sortOrder => 4;

  @override
  bool get isPinnedByDefault => false;

  @override
  String get initialRoute => '/devisList';

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: '/compta4me',
      name: 'compta4me',
      builder: (context, state) => const DevisListScreen(),
    ),
  ];
}

class SketchMyWishesModule extends AppModule {
  @override
  String get id => 'sketch';

  @override
  String get name => 'SketchMyWishes';

  @override
  String get description => 'Esquisses 3D et visualisation des envies client';

  @override
  IconData get icon => Icons.brush;

  @override
  Color get accentColor => Colors.indigo;

  @override
  int get sortOrder => 5;

  @override
  bool get isPinnedByDefault => true;

  @override
  String get initialRoute => '/sketch';

  @override
  List<RouteBase> get routes => [];
}

class AtelierModule extends AppModule {
  @override
  String get id => 'atelier';

  @override
  String get name => 'Atelier';

  @override
  String get description => 'Catalogue de matériaux et ressources';

  @override
  IconData get icon => Icons.storefront;

  @override
  Color get accentColor => Colors.amber;

  @override
  int get sortOrder => 6;

  @override
  bool get isPinnedByDefault => false;

  @override
  String get initialRoute => '/atelier';

  @override
  List<RouteBase> get routes => [];
}

class OutilsModule extends AppModule {
  @override
  String get id => 'tools';

  @override
  String get name => 'Outils & Réglages';

  @override
  String get description => 'Paramètres du cockpit et connexions';

  @override
  IconData get icon => Icons.settings_outlined;

  @override
  Color get accentColor => Colors.blueGrey;

  @override
  int get sortOrder => 7;

  @override
  bool get isPinnedByDefault => false;

  @override
  String get initialRoute => '/settingsRoute';

  @override
  List<RouteBase> get routes => [];
}
