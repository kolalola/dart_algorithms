part of 'sorter.dart';

abstract class ISorter<T> {
  final int Function(T item1, T item2)? comparator;

  ISorter({this.comparator});

  List<T> sort({required List<T> elements});

  int compareElements(T item1, T item2) {
    if (comparator != null) {
      return comparator!(item1, item2);
    } else {
      final itemString1 = item1.toString();
      final itemString2 = item2.toString();

      return itemString1.length == itemString2.length
          ? 0
          : itemString1.length > itemString2.length
              ? 1
              : -1;
    }
  }

  void swap({
    required List<T> elements,
    required int index1,
    required int index2,
  }) {
    var temp = elements[index2];
    elements[index2] = elements[index1];
    elements[index1] = temp;
  }
}
