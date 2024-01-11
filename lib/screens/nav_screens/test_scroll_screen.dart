import 'package:anchor_tabs/anchor_tabs.dart';
import 'package:flutter/material.dart';

class ScrollToTopButton extends StatelessWidget {
  const ScrollToTopButton({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.build),
              onPressed: () => Navigator.of(context).push<dynamic>(
                MaterialPageRoute<dynamic>(
                  builder: (context) => SimpleExample(),
                ),
              ),
            ),
            title: const Text('Anchor tabs example'),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.add,
                ),
                onPressed: () => Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (context) => const SimpleExample()),
                ),
              )
            ],
          ),
          body: const SimpleExample(),
        ),
      ));
}

class SimpleExample extends StatelessWidget {
  const SimpleExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> tabsText = [
      'Dịch vụ cơ sở vật chất',
      'Chính sách chỗ lưu trú',
      'Mô tả'
    ];

    final List<Widget> tabs = [];
    final List<Widget> body = [];

    for (final element in tabsText) {
      tabs.add(
        Container(
          padding: EdgeInsets.all(8.0),
          child: Text(element),
        ),
      );
      switch (element) {
        case 'Dịch vụ cơ sở vật chất':
          body.add(
            Container(
              child: Column(
                children: [
                  Text('Dịch vụ cơ sở vật chất'),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.amber,
                          child: Center(child: Text('Entry ${index}')),
                        );
                      }),
                ],
              ),
            ),
          );
          break;
        case 'Chính sách chỗ lưu trú':
          body.add(
            Container(
              child: Column(
                children: [
                  Text('Chính sách chỗ lưu trú'),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.amber,
                          child: Center(child: Text('Entry ${index}')),
                        );
                      }),
                ],
              ),
            ),
          );
          break;
        case 'Mô tả':
          body.add(
            Container(
              child: Column(
                children: [
                  Text('Mô tả'),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.amber,
                          child: Center(child: Text('Entry ${index}')),
                        );
                      }),
                ],
              ),
            ),
          );
          break;
        default:
          break;
      }
    }

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text('Simple example of anchor tabs'),
          Expanded(
              child: AnchorTabPanel(
            tabs: tabs,
            body: body,
          )),
        ],
      ),
    );
  }
}
