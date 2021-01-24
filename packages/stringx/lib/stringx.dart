library stringx;

extension StringExtensions on String {
  String trimAll() => replaceAll(RegExp(r'\s\b|\b\s'), '');

  String capitalize() => '${substring(0, 1).toUpperCase()}${substring(1)}';
}
