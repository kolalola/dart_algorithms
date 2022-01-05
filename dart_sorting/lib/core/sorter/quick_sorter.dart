part of 'sorter.dart';

class QuickSorter<T> extends ISorter<T> {
  QuickSorter({int Function(T item1, T item2)? comparator})
      : super(comparator: comparator);

  @override
  List<T> sort({required List<T> elements}) {
    _quickSort(elements, 0, elements.length - 1);
    return elements;
  }

  void _quickSort(List<T> elements, int startIndex, int endIndex) {
    final pivotIndex = _separateByPivot(elements, startIndex, endIndex);

    if (pivotIndex != -1) {
      _quickSort(elements, startIndex, pivotIndex - 1);
      _quickSort(elements, pivotIndex + 1, endIndex);
    }
  }

  int _separateByPivot(List<T> elements, int startIndex, int endIndex) {
    if (!isSmallSection(startIndex, endIndex)) {
      final pivot = elements[endIndex];
      var lastRightIndex = endIndex - 1;
      for (var i = startIndex; i < endIndex; i++) {
        if (i >= lastRightIndex) {
          break;
        } else if (compareElements(elements[i], pivot) >= 0) {
          swap(elements: elements, index1: i, index2: lastRightIndex);
          lastRightIndex--;
          i--;
        }
      }

      lastRightIndex = compareElements(elements[lastRightIndex], pivot) > 0
          ? lastRightIndex
          : lastRightIndex + 1;

      swap(elements: elements, index1: lastRightIndex, index2: endIndex);
      return lastRightIndex;
    } else {
      swapOrNothing(elements, startIndex, endIndex);
      return -1;
    }
  }

  void swapOrNothing(List<T> elements, int startIndex, int endIndex) {
    if (endIndex - startIndex == 1 &&
        compareElements(elements[startIndex], elements[endIndex]) >= 0) {
      swap(elements: elements, index1: startIndex, index2: endIndex);
    }
  }

  bool isSmallSection(int startIndex, int endIndex) =>
      endIndex - startIndex <= 1;
}
