
extension MoyeStringExtensions on String {


  String get capitalize {
    if (this.isEmpty) {
      return '';
    }

    return this[0].toUpperCase() + this.substring(1);
  }

  String get titleCase {
    if (this.isEmpty) {
      return '';
    }
    return replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.capitalize).join(' ');
  }

}