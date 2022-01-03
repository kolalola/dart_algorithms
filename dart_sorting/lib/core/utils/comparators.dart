int Function(int item1, int item2) intComparator =
    (item1, item2) => item1 == item2
        ? 0
        : item1 > item2
            ? 1
            : -1;
