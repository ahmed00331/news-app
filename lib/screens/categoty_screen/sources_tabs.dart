import 'package:flutter/material.dart';
import 'package:news_app/screens/categoty_screen/tabItem.dart';
import 'package:news_app/screens/news/newsListWidget.dart';

import '../../models/sourcesResponse/Source.dart';

class SourcesTabs extends StatefulWidget {
  List<Source> sources;

  SourcesTabs(this.sources, {super.key});

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                onTap: (value) {
                  index = value;
                  setState(() {});
                },
                tabs: widget.sources
                    .map((sources) => TabItem(
                        sources, widget.sources.indexOf(sources) == index))
                    .toList()),
          ),
          Expanded(child: NewsListWidget(widget.sources[index])),
        ],
      ),
    );
  }
}
