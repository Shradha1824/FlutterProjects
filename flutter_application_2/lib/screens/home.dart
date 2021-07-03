import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/base_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends BaseScreen {
  HomeState createState() => HomeState();
}

class HomeState extends BaseScreenState {
  List<DropdownMenuItem<int>> listDrop = [];

  void loadData() {
    listDrop.add(new DropdownMenuItem(
      child: new Text('Milimeters'),
      value: 1,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Centimeter'),
      value: 2,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Meters'),
      value: 3,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Kilometers'),
      value: 4,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Feets'),
      value: 5,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Inches'),
      value: 6,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Micrometer'),
      value: 7,
    ));

    listDrop.add(new DropdownMenuItem(
      child: new Text('Mile'),
      value: 8,
    ));
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: HexColor('#446DFF'),
      title: Text(
        'Welcome to quantity measurement',
        style: TextStyle(fontSize: 22.0, color: HexColor('#FFFFFF')),
      ),
      centerTitle: true,
    );
  }

  Widget getBody(BuildContext context) {
    loadData();
    var valueChoose;
    return Center(
        child: Container(
            child: SizedBox(
                child: ListView(children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: 50, bottom: 0, left: 0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 500,
                    margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: Text("CHOOSE TYPE",
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.1))),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      //     borderRadius: BorderRadius.only(),
                      splashColor: Colors.green,
                      child: Container(
                        width: 130.0,
                        height: 135.0,
                        child: Card(
                            margin: EdgeInsets.only(
                                top: 20, bottom: 30, left: 5, right: 5),
                            elevation: 8,
                            child: Column(children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'assets/images/scale.png',
                                  alignment: Alignment.center,
                                ),
                              ),
                              Text('Length',
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.greenAccent)),
                            ])),
                      ),
                      onLongPress: () {},
                    ),
                    Container(
                        width: 130.0,
                        height: 135.0,
                        child: Card(
                            margin: EdgeInsets.only(
                                top: 20, bottom: 30, left: 5, right: 5),
                            elevation: 8,
                            child: Column(children: <Widget>[
                              Expanded(
                                  child: Image.asset(
                                'assets/images/hot.png',
                                alignment: Alignment.center,
                              )),
                              Text('Temperature',
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                            ]))),
                    Container(
                      width: 130.0,
                      height: 135.0,
                      child: Card(
                          margin: EdgeInsets.only(
                              top: 20, bottom: 30, left: 5, right: 5),
                          elevation: 8,
                          child: Column(children: <Widget>[
                            Expanded(
                                child: Image.asset(
                              'assets/images/beaker.png',
                              alignment: Alignment.center,
                            )),
                            Text('Volume',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ])),
                    )
                  ],
                )
              ])),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Container(
          width: 145,
          margin: EdgeInsets.only(left: 37),
          child: Text('From',
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
        ),
        Container(
          width: 150,
          margin: EdgeInsets.only(right: 40),
          child: Text('To',
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
        )
      ]),
      Column(children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
              width: 150.0,
              height: 40.0,
              child: Text('1',
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.horizontal(),
              )),
          Container(
              width: 150.0,
              height: 40.0,
              child: Text('1000',
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.horizontal(),
              ))
        ]),
        Column(children: <Widget>[
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 150.0,
                    height: 40.0,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: new DropdownButton(
                        items: listDrop,
                        hint: Text('Meter: '),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 26,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        // value: valueChoose(),
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
                          });
                        })),
                Container(
                    width: 150.0,
                    height: 40.0,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: new DropdownButton(
                        items: listDrop,
                        hint: Text('Centimeter: '),
                        dropdownColor: Colors.white,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 26,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black, fontSize: 10),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
                          });
                        }))
              ]),
        ]),
      ])
    ]))));
  }
}
