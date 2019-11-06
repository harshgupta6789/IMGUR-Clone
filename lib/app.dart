import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MyFollowButton extends StatefulWidget {
  @override
  _MyFollowButtonState createState() => _MyFollowButtonState();
}

class _MyFollowButtonState extends State<MyFollowButton> {
  bool pressAttention = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
        highlightColor: pressAttention ? Colors.white70 : Colors.white30,
        color: pressAttention ? Colors.white : Colors.white30,
        child: pressAttention
            ? Text(
                'FOLLOW',
                style: TextStyle(color: Colors.black),
              )
            : Icon(
                Icons.done,
                color: Colors.white,
              ),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        onPressed: () => setState(() => pressAttention = !pressAttention));
  }
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool pressAttention = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: () {
        final snackBar = SnackBar(
          content: Text('Followed'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() => pressAttention =
                  !pressAttention); // Some code to undo the change.
            },
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
        setState(() => pressAttention = !pressAttention);
      },
      child: pressAttention
          ? SizedBox(
              child: Icon(Icons.done, color: Colors.white),
            )
          : SizedBox(
              child: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
            ),
    );
  }
}

class MyTile extends StatelessWidget {
  String imagename, text1, text2;
  double height;
  MyTile(String imagename, String text1, String text2, double height) {
    this.imagename = imagename;
    this.text1 = text1;
    this.text2 = text2;
    this.height = height;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Container(
        width: 195,
        height: 400,
        child: Stack(
          children: <Widget>[
            Container(
                height: 400,
                width: 195,
                child: Image.asset(
                  '$imagename',
                  height: height,
                  width: 140,
                  fit: BoxFit.fill,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  color: Colors.black54,
                  child: ListTile(
                    title: Text(
                      '$text1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          '$text2 Points',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class MySmallTile extends StatelessWidget {
  String imagename, text1;
  int points;
  MySmallTile(String imagename, String text1, int points) {
    this.imagename = imagename;
    this.text1 = text1;
    this.points = points;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Container(
        width: 140,
        height: 200,
        child: Stack(
          children: <Widget>[
            Container(
                height: 100,
                child: Image.asset(
                  '$imagename',
                  height: 140.0,
                  width: 140,
                  fit: BoxFit.fill,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  color: Colors.white30,
                  child: ListTile(
                    title: Text(
                      '$text1',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          '$points Points',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class Likes extends StatefulWidget {
  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  bool pressAttention = true;
  int _n = 25;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: () {
        if (pressAttention == false) {
          minus();
        } else {
          add();
        }
        setState(() => pressAttention = !pressAttention);
      },
      child: pressAttention
          ? Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
                Text(
                  '$_n',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          : Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_upward,
                  color: Colors.greenAccent,
                ),
                Text(
                  '$_n',
                  style: TextStyle(color: Colors.greenAccent),
                )
              ],
            ),
    );
  }
}

class Dislikes extends StatefulWidget {
  @override
  _DislikesState createState() => _DislikesState();
}

class _DislikesState extends State<Dislikes> {
  bool pressAttention = true;
  int _n = 6;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: () {
        if (pressAttention == false) {
          minus();
        } else {
          add();
        }
        setState(() => pressAttention = !pressAttention);
      },
      child: pressAttention
          ? Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                Text(
                  '$_n',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          : Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                ),
                Text(
                  '$_n',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
    );
  }
}

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  bool pressAttention = true;
  int _n = 10;
  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      onPressed: () {
        if (pressAttention == false) {
          minus();
        } else {
          add();
        }
        setState(() => pressAttention = !pressAttention);
      },
      child: pressAttention
          ? Row(
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                Text(
                  '$_n',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          : Row(
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.blueAccent,
                ),
                Text(
                  '$_n',
                  style: TextStyle(color: Colors.blueAccent),
                )
              ],
            ),
    );
  }
}

class MyFullTile extends StatelessWidget {
  String imagename1,
      imagename2,
      text1,
      text2,
      text3,
      text4,
      comment,
      name,
      imagename3;
  int time, likes, dislikes, heart, time2, comments;
  MyFullTile(
      String imagename1,
      String imagename2,
      String text1,
      String text2,
      String text3,
      String text4,
      int time,
      int likes,
      int dislikes,
      int heart,
      int comments,
      String name,
      int time2,
      String comment,
      String imagename3) {
    this.imagename1 = imagename1;
    this.imagename2 = imagename2;
    this.imagename3 = imagename3;
    this.text1 = text1;
    this.text2 = text2;
    this.text3 = text3;
    this.text4 = text4;
    this.time = time;
    this.likes = likes;
    this.dislikes = dislikes;
    this.heart = heart;
    this.time2 = time2;
    this.comment = comment;
    this.comments = comments;
    this.name = name;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          margin: EdgeInsets.only(left: 8),
          color: Colors.white30,
          height: 599,
          width: 420,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(2000),
                  child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        "$imagename1",
                        fit: BoxFit.fill,
                      )),
                ),
                subtitle: Column(children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Text('$text1',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))
                        ],
                      )),
                  Row(children: <Widget>[
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '$text2',
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyButton()
                  ])
                ]),
                trailing: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.open_with,
                        color: Colors.white,
                      ),
                      Text(
                        '$time min',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "$imagename2",
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        bottom: 15,
                        left: 160,
                        child: SizedBox(
                          height: 20,
                          width: 100,
                          child: RaisedButton(
                            child: Text(
                              'SEE MORE',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                      width: 150,
                      height: 28,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Colors.purple,
                            child: Row(
                              children: <Widget>[
                                MyButton(),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$text3',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ))),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 150,
                      height: 28,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: Colors.black,
                            child: Row(
                              children: <Widget>[
                                MyButton(),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '$text4',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 30,
                  width: 550,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Likes(),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Dislikes(),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Heart(),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.share,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                width: 550,
                color: Colors.white10,
                child: Column(
                  children: <Widget>[
                    Container(
                        child: Column(children: <Widget>[
                      Container(
                        height: 40,
                        width: 550,
                        child: ListTile(
                          leading: Text(
                            '$comments Comments',
                            style:
                                TextStyle(fontSize: 12, color: Colors.white30),
                          ),
                          trailing: Container(
                              height: 100,
                              width: 120,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.message,
                                    size: 14,
                                    color: Colors.white70,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Add Comment',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white70),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ])),
                    Container(
                        child: Column(children: <Widget>[
                      Container(
                        height: 50,
                        width: 550,
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(2000),
                            child: Container(
                                width: 30,
                                height: 30,
                                child: Image.asset(
                                  "$imagename3",
                                  fit: BoxFit.fill,
                                )),
                          ),
                          subtitle: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 80,
                              ),
                              Column(children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Text('$name  $time2 h',
                                        style: TextStyle(
                                          color: Colors.white10,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ))),
                                Text(
                                  '$comment',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ]),
                            ],
                          ),
                        ),
                      ),
                    ]))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  color: Colors.green,
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Container()),
                        TabBar(
                          tabs: [
                            Text(
                              "Most Viral",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text("Feed", style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: TabBarView(children: [
                Container(
                    height: 1000,
                    child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Container(
                            color: Colors.black,
                            child: SizedBox(
                              height: 8,
                            ),
                          ),
                          Container(
                              color: Colors.black,
                              child: Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      MyTile('assets/images/a1.jpg',
                                          'This is awesome', '5162', 140.0),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MyTile('assets/images/a2.jpg',
                                          'This is awesome', '5162', 120.0),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MyTile('assets/images/a3.jpg',
                                          'This is awesome', '5162', 130.0),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MyTile('assets/images/a4.jpg',
                                          'This is awesome', '5162', 130.0),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MyTile('assets/images/a5.jpg',
                                          'This is awesome', '5162', 140.0),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      MyTile('assets/images/b1.jpg',
                                          'This is awesome', '5162', 130.0),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MyTile('assets/images/b2.jpg',
                                          'This is awesome', '5162', 140.0),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MyTile('assets/images/b3.jpg',
                                          'This is awesome', '5162', 130.0),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MyTile('assets/images/b4.jpg',
                                          'This is awesome', '5162', 140.0),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      MyTile('assets/images/b5.jpg',
                                          'This is awesome', '5162', 120.0),
                                    ],
                                  ),
                                ],
                              )),
                          Container(
                            color: Colors.black,
                            child: SizedBox(
                              height: 8,
                            ),
                          ),
                        ])),
                Container(
                    color: Colors.black,
                    width: 1000,
                    child: ListView(
                      children: <Widget>[
                        Container(
                            height: 75,
                            color: Colors.black,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              "assets/images/maindp.jpg"))),
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.only(right: 80.0, top: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(bottom: 10),
                                            child: Text('unmuted shitpost',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ))),
                                        Text(
                                          'SIMILAR TO:UNMUTED',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13.0),
                                        )
                                      ],
                                    )),
                                SizedBox(
                                    width: 90,
                                    height: 28, // specific value
                                    child: MyFollowButton()),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            color: Colors.black,
                            height: 160,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile10.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile2.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile3.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile4.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile5.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile6.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile7.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile8.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile9.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                                MySmallTile('assets/images/tile10.jpg',
                                    'This is awesome', 3423),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        MyFullTile(
                            'assets/images/dp1.jpg',
                            'assets/images/4.jpg',
                            'HAHAHA',
                            'raniGifHero',
                            'funny',
                            'doggy',
                            34,
                            20,
                            6,
                            10,
                            4,
                            'Jdonkay',
                            1,
                            'Tat fisrt one is so relatable',
                            'assets/images/dp4.jpg'),
                        SizedBox(
                          height: 10,
                        ),
                        MyFullTile(
                            'assets/images/dp2.jpg',
                            'assets/images/5.jpg',
                            'HAHAHA',
                            'raniGifHero',
                            'funny',
                            'doggy',
                            34,
                            20,
                            6,
                            10,
                            4,
                            'Jdonkay',
                            1,
                            'Tat fisrt one is so relatable',
                            'assets/images/dp5.jpg'),
                        SizedBox(
                          height: 10,
                        ),
                        MyFullTile(
                            'assets/images/dp3.jpg',
                            'assets/images/6.jpg',
                            'HAHAHA',
                            'raniGifHero',
                            'funny',
                            'doggy',
                            34,
                            20,
                            6,
                            10,
                            4,
                            'Jdonkay',
                            1,
                            'That first one is so relatable',
                            'assets/images/dp6.jpg'),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )),
              ]),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                fixedColor: Colors.white,
                backgroundColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home, color: Colors.grey),
                      title: Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search, color: Colors.grey),
                      title: Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.photo_camera, color: Colors.grey),
                      title: Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications, color: Colors.grey),
                      title: Text('')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person, color: Colors.grey),
                      title: Text(''))
                ],
                onTap: (index) {},
              ),
            )));
  }
}
