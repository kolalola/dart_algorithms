part of 'sorter.dart';

class InsertionSorter<T> extends ISorter<T> {
  InsertionSorter({int Function(T item1, T item2)? comparator})
      : super(comparator: comparator);

  @override
  List<T> sort({required List<T> elements}) {
    for (var i = 0; i < elements.length; i++) {
      final temp = elements[i];
      for (var j = i; j >= 0; j--) {
        if (j == 0 || compareElements(temp, elements[j - 1]) > 0) {
          elements[j] = temp;
          break;
        } else {
          elements[j] = elements[j - 1];
        }
      }
    }

    return elements;
  }
}
