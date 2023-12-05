import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
    const HomePage({super.key}); 

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(),
            body: Column(
                children: [
                    searchField(),
                ],
            ),
        );
    }

    Container searchField() {
        return Container(
                        margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                        decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: const Color(0xff1D1617).withOpacity(0.2),
                                blurRadius: 40,
                                spreadRadius: 0.0,
                            )
                        ]),
                        child : TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: "Search for Life",
                                    hintStyle: const TextStyle(
                                        color: Color(0xffDDDADA),
                                        fontSize: 16,
                                    ),
                                    contentPadding: const EdgeInsets.all(15),
                                    fillColor: const Color(0xffF7F8F8),
                                    prefixIcon: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: SvgPicture.asset('assets/icons/Search.svg'),
                                    ),
                                    suffixIcon: SizedBox(
                                        width: 100,
                                        child : IntrinsicHeight (
                                            child :Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                    const VerticalDivider(
                                                        color: Colors.black,
                                                        indent: 10,
                                                        endIndent: 10,
                                                        thickness: 0.2,
                                                    ),
                                                    Padding(
                                                        padding: const EdgeInsets.all(10), 
                                                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide.none
                                    )
                                ),
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