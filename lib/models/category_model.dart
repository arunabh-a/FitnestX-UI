
import 'package:flutter/material.dart';

class CategoryModel {
    String iconPath;
    String name;
    Color boxColor;

    CategoryModel({
        required this.iconPath,
        required this.name,
        required this.boxColor,
    });

static List <CategoryModel> getCategories() {
        List<CategoryModel> categories = [];

        categories.add(
            CategoryModel(
                iconPath: 'assets/icons/plate.svg', 
                name: 'Salad', 
                boxColor: const Color(0xff92A3FD)
            )
        );

        categories.add(
            CategoryModel(
                iconPath: 'assets/icons/pancakes.svg', 
                name: 'Cake', 
                boxColor: const Color(0xffC588F2)
            )
        );

        categories.add(
            CategoryModel(
                iconPath: 'assets/icons/pie.svg', 
                name: 'Pie', 
                boxColor: const Color(0xff92A3FD)
            )
        );

        categories.add(
            CategoryModel(
                iconPath: 'assets/icons/orange-snacks.svg', 
                name: 'Smoothies', 
                boxColor: const Color(0xffC588F2)
            )
        );

        return categories;
    }
}
