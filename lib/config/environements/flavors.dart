import 'package:freezed_annotation/freezed_annotation.dart';

part 'flavors.g.dart';

@JsonEnum(alwaysCreate: true)
enum Flavor {
  @JsonValue('local')
  local,
  @JsonValue('development')
  development,
  @JsonValue('production')
  production
}

class F {
  static Flavor? _appFlavor;

  static Flavor get appFlavor {
    if (_appFlavor == null) {
      throw StateError('F.appFlavor has not been initialized');
    }
    return _appFlavor!;
  }

  static set appFlavor(Flavor flavor) {
    _appFlavor = flavor;
  }

  static void reset() {
    _appFlavor = null;
  }

  static String get title => appFlavor.label;

  static String get envFileName => appFlavor.enFilePath;
}

extension FlavorX on Flavor {
  String get enFilePath => 'assets/json/$name.config.json';
  String get label => 'Example $name';
}
