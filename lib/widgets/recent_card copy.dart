import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tabbed Layout in Column'),
        ),
        body: Column(
          children: [
            // Content above the tabs
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text('Content Above Tabs'),
            ),

            // Tabbed Layout
            DefaultTabController(
              length: 3, // Set the number of tabs you want
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                      Tab(text: 'Tab 3'),
                    ],
                  ),
                  TabBarView(
                    children: [
                      // Content for Tab 1
                      Center(child: Text('Tab 1 Content')),

                      // Content for Tab 2
                      Center(child: Text('Tab 2 Content')),

                      // Content for Tab 3
                      Center(child: Text('Tab 3 Content')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
