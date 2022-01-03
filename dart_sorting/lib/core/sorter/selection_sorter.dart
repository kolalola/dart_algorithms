part of 'sorter.dart';

class SelectionSorter<T> extends ISorter<T> {
  SelectionSorter({int Function(T item1, T item2)? comparator})
      : super(comparator: comparator);

  @override
  List<T> sort({required List<T> elements}) {
    var currentIndex = 0;
    var minimumIndex = 0;
    while (currentIndex < elements.length) {
      var minimumValue = elements[currentIndex];

      for (var i = currentIndex; i < elements.length; i++) {
        if (compareElements(minimumValue, elements[i]) > 0) {
          minimumValue = elements[i];
          minimumIndex = i;
        }
      }

      swap(elements: elements, index1: currentIndex, index2: minimumIndex);
      currentIndex = currentIndex + 1;
      minimumIndex = currentIndex;
    }

    return elements;
  }
}
