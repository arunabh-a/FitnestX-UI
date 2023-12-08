import 'package:DyFit/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key}); 

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List<CategoryModel> categories = [];

    void _getCategories(){
        categories = CategoryModel.getCategories();
    }

    
    @override
    Widget build(BuildContext context) {
        _getCategories();
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(),
            body: Column(
                children: [
                    searchField(),
                    const SizedBox(height: 40,),
                    categoriesSec()
                ],
            ),
        );
    }

    Column categoriesSec() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text('Category',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                ),
                            ),
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(
                            height: 150,
                            child: ListView.separated(
                                itemCount: categories.length,
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    ),
                                separatorBuilder: (context, index) => const SizedBox(width: 25,),
                                itemBuilder: (context, index) {
                                    return Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: categories[index].boxColor,
                                            borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                                Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: const BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle
                                                    ),
                                                        child: Padding(
                                                            padding: const EdgeInsets.all(10),
                                                            child: SvgPicture.asset(categories[index].iconPath,),
                                                        ),
                                                    ),
                                                Text(
                                                    categories[index].name,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                )        
                                                )
                                            ],
                                        ),
                                    );
                                },
                            ),
                        )
                ],);
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