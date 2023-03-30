enum Flavors {
  development('.env.development');

  final String _environment;
  const Flavors(this._environment);

  String getEnvironment() => _environment;
}
