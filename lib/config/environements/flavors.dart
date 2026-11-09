enum Flavor { local, development, production }

class F {
  static Flavor? appFlavor;

  static String get title => 'Example ${appFlavor?.name ?? 'development'}';

  static String get envFileName =>
      'assets/json/${appFlavor?.name ?? 'development'}.config.json';
}
