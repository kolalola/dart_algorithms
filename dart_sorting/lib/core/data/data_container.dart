
import 'package:dart_sorting/core/sorter/sorter.dart';

class DataContainer<T> {
  final ISorter<T> sorter;
  final T Function() random;
  final int length;

  DataContainer({required this.sorter, required this.random, this.length = 20});

  late List<T> elements;

  void init() {
    elements = List.generate(length, (index) => random());
  }

  void fromList(List<T> items) => elements = items;

  void printContent() => print(elements.join(','));

  void sort() {
    elements = sorter.sort(elements: elements);
  }

  bool isSorted() {
    for (var i = 0; i < elements.length - 1; i++) {
      if (sorter.compareElements(elements[i], elements[i + 1]) > 0) {
        return false;
      }
    }
    return true;
  }
}
