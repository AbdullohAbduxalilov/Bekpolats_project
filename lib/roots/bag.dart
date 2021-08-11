import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:imtixon/roots/json.dart';

class Bag extends StatefulWidget {
  int _index;

  Bag(this._index);

  @override
  _BagState createState() => _BagState();
}

class _BagState extends State<Bag> {
  int _qty = 0;
  int _summ = 0;

  int _funcSumm(){
    for(int i=0;i<widget._index;i++){
      _summ+=DataJson.summa[i];
    }
    return _summ;
  }


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
          "Bag",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Your Bag",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              widget._index.toString() + " Items",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black38,
              ),
            ),
          ),
          SizedBox(height: 28.0),
          Expanded(
            child: ListView.builder(
              itemCount: widget._index,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 28.0),
                    leading: Container(
                      width: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.black12.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: NetworkImage(DataJson.image[index]),
                        )
                      ),
                    ),
                    title: Text(
                      DataJson.type[index],
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                    ),
                    subtitle: Text("\$" + DataJson.summa[index].toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        setState(() {
                          widget._index-=1;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
                boxShadow: [
                  BoxShadow(offset: Offset(0, -0.8), color: Colors.black12)
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 18.0, color: Colors.black26),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "\$${_funcSumm()}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24.0),
                      )
                    ],
                  ),
                  Container(
                    width: 200.0,
                    height: 58.0,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.black87,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0))),
                      onPressed: () {},
                      child: Text(
                        "Chackout",
                        style: TextStyle(
                          fontSize: 18.0,
                          wordSpacing: 2.0,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
