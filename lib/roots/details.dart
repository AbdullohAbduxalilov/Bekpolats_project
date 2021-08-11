import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:imtixon/roots/json.dart';

import 'bag.dart';

class Details extends StatefulWidget {
  int _index;
  Details(this._index);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _like = 0;
  Color _likeColor = Colors.white;
  int _qty = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
            size: 20.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Details",
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
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 232.0,
                  width: 320.0,
                  child: CircleAvatar(
                    radius: 116.0,
                    backgroundColor: Colors.black12.withOpacity(0.1),
                    backgroundImage: NetworkImage(DataJson.image[widget._index]),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.black12.withOpacity(0.05),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (_like == 0) {
                            _likeColor = Colors.red;
                            _like = 1;
                          } else {
                            _likeColor = Colors.white;
                            _like = 0;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: _likeColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 24.0,
                  backgroundImage: NetworkImage(DataJson.image[widget._index]),
                  backgroundColor: Colors.black12.withOpacity(0.05),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(DataJson.image[widget._index]),
                    backgroundColor: Colors.black12.withOpacity(0.05),
                  ),
                ),
                CircleAvatar(
                  radius: 24.0,
                  backgroundImage: NetworkImage(DataJson.image[widget._index]),
                  backgroundColor: Colors.black12.withOpacity(0.05),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DataJson.type[widget._index],style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                      SizedBox(height: 12.0,),
                      Text("\$" + DataJson.summa[widget._index].toString(),style: TextStyle(fontSize: 18.0),),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 72.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          color: Colors.orange[200],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          height: 72.0,
                          width: 36.0,
                          decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      Container(
                        height: 72.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                children: [
                  Text(
                    "More compact. More powerful.",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(offset: Offset(0, -0.5), color: Colors.black38)
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(24.0)),
                      height: 60.0,
                      width: 40.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text(
                              "-",
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (_qty > 0) {
                                  _qty -= 1;
                                }
                              });
                            },
                          ),
                          InkWell(
                            child: Text(
                              "+",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _qty += 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text("QTY: ",
                            style: TextStyle(
                                color: Colors.black26, fontSize: 18.0)),
                        Text("$_qty",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0)),
                      ],
                    ),
                    SizedBox(width: 30.0),
                    Container(
                      width: 200.0,
                      height: 58.0,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0))
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Bag(widget._index)));
                        },
                        child: Text(
                          "Add to Bag",
                          style: TextStyle(
                            fontSize: 16.0,
                            wordSpacing: 2.0,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
