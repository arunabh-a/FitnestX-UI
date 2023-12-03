import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
    const HomePage({super.key}); 

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: appBar(),
            body: const Column(
                children: [
                    TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffF7F8F8),

                        ),
                    )
                ],
            ),
        );
    }

    AppBar appBar() {
    return AppBar(
            title: const Text("Dashboard",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                ),
            ),
            centerTitle: true,
            leading: GestureDetector(
                child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color(0xffF7F8F8),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SvgPicture.asset(
                        "assets/icons/arrow-back-ios.svg",
                        height: 20,
                        width: 20,
                    ),
                ),
            ),
            actions: [
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        width: 35,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color(0xffF7F8F8),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: SvgPicture.asset(
                            "assets/icons/more-horiz.svg",
                            height: 20,
                            width: 20,
                        ),
                    ),
                ),
            ],
        );
    }
}