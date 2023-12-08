// ignore_for_file: sort_child_properties_last

import 'package:fitnest/models/category_model.dart';
import 'package:fitnest/models/diet_model.dart';
import 'package:fitnest/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key}); 

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List<CategoryModel> categories = [];
    List<DietModel> diets = [];
    List<PopularSec> popularDiets = [];


    
    void getInitialInfo(){
        categories = CategoryModel.getCategories();
        diets = DietModel.getDiets();
        popularDiets = PopularSec.getPopularSec();
    }

    @override
    Widget build(BuildContext context) {
        getInitialInfo();
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(),
            body: ListView(
                children: [
                    searchField(),
                    const SizedBox(height: 40,),
                    categoriesSec(),
                    const SizedBox(height: 40,),
                    dietSec(),
                    const SizedBox(height: 40,),
                    popularDietSec(),
                    const SizedBox(height: 40,),
                ],
            ),
        );
    }

    Column popularDietSec() {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child : Text(
                                'Popular',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                            )
                        ),
                        const SizedBox(height: 15,),

                        ListView.separated(
                            itemBuilder: ((context, index){
                                return Container(
                                    height: 100,
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        // crossAxisAlignment: ,
                                        children: [
                                            SvgPicture.asset(
                                                popularDiets[index].iconPath,
                                                width: 65,
                                                height: 65,),
                                            Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                    Text(
                                                        popularDiets[index].name,
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.black,
                                                            fontSize: 16
                                                        ),
                                                    ),
                                                    Text(
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                    popularDiets[index].level + ' | ' + popularDiets[index]. duration + ' | ' + popularDiets[index].calorie,
                                                        style: const TextStyle(
                                                            color: Color(0xff7B6F72),
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.bold,
                                                        ),
                                                    ),
                                                ],
                                            ),
                                            GestureDetector(
                                                onTap: (){},
                                                child :SvgPicture.asset(
                                                    'assets/icons/button.svg',
                                                    width: 30,
                                                    height: 30,
                                                )
                                            )
                                        ]
                                    ),
                                    decoration: BoxDecoration(
                                        color: popularDiets[index].boxIsSelected ? Colors.white : Colors.white.withOpacity(0.5),                                    
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                            BoxShadow(
                                                color:  const Color(0xff101617).withOpacity(0.2),
                                                offset: const Offset(0, 10),
                                                blurRadius: 40,
                                                spreadRadius: 0
                                            )
                                        ]
                                    )
                                );
                            }), 
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => const SizedBox(height: 12,),
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            itemCount: popularDiets.length,
                            ),
                    ],
                );
    }

    Column dietSec() {
        return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                    'Recommendations\nfor you',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                    ),
                                )
                            ),
                            const SizedBox(height: 15,),
                            SizedBox(
                                height: 235,
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                        return Container(
                                            width: 210,
                                            decoration: BoxDecoration(
                                                color: diets[index].boxColor.withOpacity(0.3),
                                                borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                SvgPicture.asset(diets[index].iconPath),
                                                Column(
                                                    children: [
                                                        Text(diets[index].name,
                                                            style: const TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                color: Colors.black,
                                                                fontSize: 16,
                                                            ),
                                                        ),
                                                        Text(
                                                    // ignore: prefer_interpolation_to_compose_strings
                                                        diets[index].level + ' | ' + diets[index]. duration + ' | ' + diets[index].calorie,
                                                            style: const TextStyle(
                                                                color: Color(0xff7B6F72),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.bold,
                                                            ),
                                                        ),
                                                    ],
                                                    
                                                ),
                                                
                                                Container(
                                                    height: 45,
                                                    width: 130,
                                                    decoration: BoxDecoration(
                                                        gradient:  LinearGradient(
                                                            colors: [
                                                                diets[index].viewIsSelected ? const Color(0xff9DCEFF) : Colors.transparent,
                                                                diets[index].viewIsSelected ? const Color(0xff92A3FD) : Colors.transparent,
                                                            ],
                                                        ),
                                                        borderRadius: BorderRadius.circular(50)
                                                    ),
                                                    child: Center(
                                                            child: Text(
                                                                'View',
                                                                style: TextStyle(
                                                                    color: diets[index].viewIsSelected ? Colors.white : const Color(0xffC588F2),
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold,
                                                                ),
                                                            ),
                                                        ),
                                                )
                                            ],
                                            
                                        ),
                                        );
                                    },
                                    separatorBuilder: (context, index) => const SizedBox(width: 25,),
                                    itemCount: diets.length,
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                )
                            )

                        ],  
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