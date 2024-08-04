import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myblog/app/modules/home/controllers/controllers.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 250,),
            const Center(
              child: Text(
                'HomeView is working',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Card(
              // color: Color(0xffe33e6f),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: ListTile(
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "الترحيب",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        fontSize: 22,
                        letterSpacing: 0.1,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  controller.showOnBoarding();
                },
              ),
            ),
                Card(
                  // color: Color(0xffe33e6f),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListTile(
                    title: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "خروج",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffffffff),
                            fontSize: 22,
                            letterSpacing: 0.1,
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      controller.signout();
                    },
                  ),
                ),
            const SizedBox(height: 250,),
          ],
        ),
      ),
    );
  }
}
