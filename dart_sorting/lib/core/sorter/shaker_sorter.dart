part of 'sorter.dart';

class ShakerSorter<T> extends ISorter<T> {
  ShakerSorter({int Function(T item1, T item2)? comparator})
      : super(comparator: comparator);

  @override
  List<T> sort({required List<T> elements}) {
    var wasSwapped = true;
    while (wasSwapped) {
      wasSwapped = false;
      for (var i = 0; i < elements.length - 1; i++) {
        final nextIndex = i + 1;
        final compareResult = compareElements(elements[i], elements[nextIndex]);
        if (compareResult > 0) {
          swap(elements: elements, index1: i, index2: nextIndex);
          wasSwapped = true;
        }
      }

      if (!wasSwapped) {
        break;
      }
      wasSwapped = false;

      for (var i = elements.length - 1; i > 0; i--) {
        final prevIndex = i - 1;
        final compareResult = compareElements(elements[i], elements[prevIndex]);
        if (compareResult < 0) {
          swap(elements: elements, index1: i, index2: prevIndex);
          wasSwapped = true;
        }
      }
    }

    return elements;
  }
}
