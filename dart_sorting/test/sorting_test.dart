import 'dart:math';

import 'package:dart_sorting/core/data/data_container.dart';
import 'package:dart_sorting/core/sorter/sorter.dart';
import 'package:dart_sorting/core/utils/comparators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Sorting', () {
    _testSorting('Bubble sort', BubbleSorter(comparator: intComparator));
    _testSorting('Shaker sort', ShakerSorter(comparator: intComparator));
    _testSorting('Hairbrush sort', HairbrushSorter(comparator: intComparator));
    _testSorting('Insertion sort', InsertionSorter(comparator: intComparator));
    _testSorting('Selection sort', SelectionSorter(comparator: intComparator));
    _testSorting('Quick sort', QuickSorter(comparator: intComparator));
  });
}

void _testSorting(String name, ISorter<int> sorter) {
  test(name, () {
    final container = DataContainer<int>(
        sorter: sorter, random: () => Random().nextInt(10000), length: 55);
    container.init();
    container.sort();
    expect(container.isSorted(), true);
  });
}
