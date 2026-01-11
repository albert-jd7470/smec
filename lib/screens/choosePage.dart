import 'package:flutter/material.dart';
import 'package:smec/screens/homepage.dart';

class ChoosePage extends StatefulWidget {
  const ChoosePage({super.key});

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  final List level=[
    "Beginner",
    "Medium",
    "Professional",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.teal,),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                border:   Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 7), // x, y
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.12),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 7),
                              ),
                            ],
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Beginner", style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Kufam',
                              ),
                              )
                            ],
                          ),
                        ),
                      );

                    },
                    ),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
