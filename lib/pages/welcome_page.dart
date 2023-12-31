import 'package:apptest/widgets/app_large_text.dart';
import 'package:apptest/widgets/app_text.dart';
import 'package:apptest/widgets/button_rep%C3%B3nive.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ['bannerQTmb.png', 'bannerQTmb.png', 'bannerQTmb.png'];
  List texts = ['Chào mừng', 'Welcome', 'Ni Hao'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        // ignore: prefer_interpolation_to_compose_strings
                        "img/" + images[index],
                      ),
                      fit: BoxFit.cover)),
              child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          AppLargeText(size: 50, text: texts[index]),
                          AppText(size: 45, text: "đến với klook"),
                          SizedBox(
                            height: 40,
                          ),
                          ReponsiveButton(
                            width: 100,
                            onPressed: () {
                              // Thực hiện điều hướng đến HomePage khi nhấn vào button
                              Navigator.pushReplacementNamed(context, '/home');
                            },
                          )
                        ],
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
