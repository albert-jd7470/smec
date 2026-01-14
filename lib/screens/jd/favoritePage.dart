import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int selectedIndex = 0;

  final List<String> categories = [
    "Flutter",
    "MERN",
    "UI/UX",
    "Python",
  ];


  Widget item(String course, int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8), // left-aligned feel
        child: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.teal),
          ),
          child: Align(
            alignment: Alignment.center, // text centered inside pill
            child: Text(
              course,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.teal,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),
        backgroundColor: Colors.teal,
        title:  Text("Favorites",style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: 'Poppins',
        )),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 50,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                categories.length,
                    (index) => item(categories[index], index),
              ),
            ),
          ),
          const SizedBox(height: 25,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Who is making the Web standards?",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Who is making the Web standards?",
                          style: TextStyle(fontSize: 15, fontFamily: "Poppins"),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Icon(Icons.favorite_border,color: Colors.teal)
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
