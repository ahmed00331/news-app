import 'package:flutter/material.dart';

import '../../models/sourcesResponse/Source.dart';

class TabItem extends StatelessWidget {
  Source sources;
  bool isSelected;

  TabItem(this.sources, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Text(
        sources.name ?? "",
        style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
