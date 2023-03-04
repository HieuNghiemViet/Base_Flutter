enum EnvironmentType { development, production, staging }

extension EnvironmentTypeX on EnvironmentType {
  static from(String name) {
    switch (name) {
      case "development":
        return EnvironmentType.development;
      case "staging":
        return EnvironmentType.staging;
      case "production":
        return EnvironmentType.production;
      default:
        return EnvironmentType.development;
    }
  }
}

abstract class EnvironmentBase {
  String get host;

  String get name;

  Duration get apiTimeout => const Duration(minutes: 3); // 3 minute

  EnvironmentType get type;
}

class _Development extends EnvironmentBase {
  @override
  String get host => 'https://google.com';

  @override
  String get name => EnvironmentType.development.name;

  @override
  EnvironmentType get type => EnvironmentType.development;
}

class _Staging extends EnvironmentBase {
  @override
  String get host => 'https://google.com';

  @override
  String get name => EnvironmentType.staging.name;

  @override
  EnvironmentType get type => EnvironmentType.staging;
}

class _Production extends EnvironmentBase {
  @override
  String get host => 'https://google.com';

  @override
  String get name => EnvironmentType.production.name;

  @override
  EnvironmentType get type => EnvironmentType.production;
}

class Environment {
  static EnvironmentBase _environment = _Development();

  static String get host => _environment.host;

  static String get name => _environment.name;

  static Duration get apiTimeout => _environment.apiTimeout;

  static void config(EnvironmentType type) {
    switch (type) {
      case EnvironmentType.development:
        _environment = _Development();
        break;
      case EnvironmentType.production:
        _environment = _Production();
        break;
      case EnvironmentType.staging:
        _environment = _Staging();
        break;
    }
  }

  static EnvironmentType get currentType => _environment.type;
}
