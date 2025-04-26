enum Flavor { local, development, production }

class F {
  static late final Flavor appFlavor;

  static String get title {
    if (appFlavor == null) {
      throw Exception('appFlavor must be initialized before use');
    }
    return appFlavor.label;
  }

  static String get envFileName {
    if (appFlavor == null) {
      throw Exception('appFlavor must be initialized before use');
    }
    return appFlavor.enFilePath;
  }
}

extension FlavorX on Flavor {
  String get enFilePath => 'assets/json/$name.config.json';
  String get label => 'Example $name';
}
