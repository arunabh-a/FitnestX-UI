import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
    const HomePage({super.key}); 

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Dashboard",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    ),
                ),
                centerTitle: true,
                leading: Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)
                    ),
                ),
            ),
        );
    }
}