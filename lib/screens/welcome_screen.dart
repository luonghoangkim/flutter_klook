import 'package:apptest/theme/app_color.dart';
import 'package:apptest/widgets/app_large_text.dart';
import 'package:apptest/widgets/app_text.dart';
import 'package:apptest/widgets/button_rep%C3%B3nive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = ['logo-klook.jpeg', 'bannerQTmb.png', 'bannerQTmb.png'];
  List texts = ['Chào mừng', 'Welcome', 'Ni Hao'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "img/" + images[index],
                      ),
                      fit: BoxFit.contain)),
              child: Container(
                  width: double.maxFinite,
                  margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 250),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Text(
                            //   'Chào mừng đến với Klook',
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //       color: AppColors.primaryColor,
                            //       fontSize: 50,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // const SizedBox(
                            //   height: 40,
                            // ),
                            ReponsiveButton(
                              width: 100,
                              onPressed: () {
                                // Thực hiện điều hướng đến HomePage khi nhấn vào button
                                Get.offNamed('/home');
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
