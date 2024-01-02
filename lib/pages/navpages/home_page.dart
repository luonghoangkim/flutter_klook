import 'package:apptest/widgets/button_rep%C3%B3nive.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Ấn Button để vào khách sạn'),
            ReponsiveButton(
              width: 100,
              onPressed: () {
                // Thực hiện điều hướng đến HomePage khi nhấn vào button
                Navigator.pushNamed(context, '/hotel');
              },
            )
          ],
        ),
      ),
    );
  }
}
