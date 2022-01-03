part of 'sorter.dart';

class HairbrushSorter<T> extends ISorter<T> {
  HairbrushSorter({int Function(T item1, T item2)? comparator})
      : super(comparator: comparator);

  @override
  List<T> sort({required List<T> elements}) {
    const factor = 1.247;
    var offset = elements.length;
    while (offset != 0) {
      offset = (offset / factor).floor();
      var i = 0;
      while (i + offset < elements.length) {
        final compareResult =
            compareElements(elements[i], elements[i + offset]);
        if (compareResult > 0) {
          swap(elements: elements, index1: i, index2: i + offset);
        }
        i++;
      }
    }

    return elements;
  }
}
