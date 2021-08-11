import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtixon/roots/details.dart';
import 'package:imtixon/roots/json.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 96.0,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
          size: 20.0,
        ),
        title: Text(
          "Explore",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 18.0,
              crossAxisSpacing: 24.0,
              childAspectRatio: 0.73,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/Details/$index");
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 160.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.03),
                          borderRadius: BorderRadius.all(Radius.circular(30.0))
                        ),
                        child: Image.network(DataJson.image[index],fit: BoxFit.fill,),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(DataJson.type[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                            SizedBox(height: 5.0,),
                            Text("\$${DataJson.summa[index]}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: DataJson.image.length,
        ),
      ),
    );
  }
}
