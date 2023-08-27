
extension MoyeStringExtensions on String {


  /// capitalizes the string and returns it
  String get capitalize {
    if (this.isEmpty) {
      return '';
    }

    return this[0].toUpperCase() + this.substring(1);
  }

  /// returns a string that has title casing
  String get titleCase {
    if (this.isEmpty) {
      return '';
    }
    return replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize).join(' ');
  }

}