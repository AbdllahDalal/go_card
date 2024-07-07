import 'package:flutter/material.dart';

import 'specification_row.dart';

List<Widget> specificationColumn(Map specificationMap, double rowWidth) {
  List<Widget> specification = [];
  for (int i = 0; i < specificationMap.length; i++) {
    specification.add(SpecificationRow(
      options:
          specificationMap[specificationMap.keys.toList(growable: false)[i]],
      title: specificationMap.keys.toList(growable: false)[i],
      typeColors: false,
      rowWidth: rowWidth,
    ));
  }
  return specification;
}
