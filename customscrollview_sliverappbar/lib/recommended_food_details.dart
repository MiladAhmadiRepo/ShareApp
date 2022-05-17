import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  RecommendedFoodDetail({Key? key}) : super(key: key);

  String st = "sdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasdsdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasdsdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasdsdasdasdasdsdasdasdasd"
      "sdasdasdasdsdasdasdasdsdasdasdasdsdasdasdasd";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.ac_unit_sharp),
                Icon(Icons.access_alarms)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  )
                ),
                width: double.maxFinite,
                padding: EdgeInsets.all(20),
                child: Center(child: Text("hiiiiii")),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.blue,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food.jpeg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              st,
              style: TextStyle(fontSize: 45),
            ),
          )
        ],
      ),
    );
  }
}
