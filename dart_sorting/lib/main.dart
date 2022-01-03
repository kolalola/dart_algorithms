import 'dart:math';

import '../core/data/data_container.dart';
import '../core/sorter/sorter.dart';
import '../core/utils/comparators.dart';


void main() {
  final container = DataContainer<int>(
    sorter: BubbleSorter(comparator: intComparator),
    random: () => Random().nextInt(10000),
  );
  container.init();
  container.printContent();
  container.sort();
  container.printContent();
}
