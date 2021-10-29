extension ArrayExtension on List<num> {


  /// returns true if [list] is in ascending order or it's empty
  bool get isAscendingOrder {
    if (isEmpty) {
      return true;
    }
    num pre = first;
    for (int i = 1; i < length; i++) {
      if (pre > this[i]) {
        return false;
      }
      pre = this[i];
    }
    return true;
  }

}