extension StringExtension on String {
  String get path => "/$this";

  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
