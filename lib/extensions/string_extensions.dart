// Useful extensions on strings
extension MoyeStringExtensions on String {
  /// capitalizes the string and returns it
  String get capitalize {
    if (this.isEmpty) {
      return '';
    }

    return this[0].toUpperCase() + this.substring(1);
  }

  /// Convert [this] to a title case string and return it
  String get titleCase {
    if (this.isEmpty) {
      return '';
    }
    return replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize).join(' ');
  }
}
