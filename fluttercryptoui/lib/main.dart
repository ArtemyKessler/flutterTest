import 'package:flutter/material.dart';
import 'package:fluttercryptoui/bid.dart';
import 'package:fluttercryptoui/language.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.blueGrey[800],
        cardColor: Colors.blueGrey[600],
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> menuOptions = ['Deposit', 'Withdraw', 'Finance', 'Profile management', 'Education'];
  List<Language> languages = [
    Language(name: "English", pic: "images/english.png"),
    Language(name: "Русский", pic: "images/russian.png")
  ];
  String pickedShowMode = "All";
  bool drawerIntrumentsPicked = true;
  List<Bid> drawerBids = [
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
    Bid(up: true, bid: 110, ask: 120, symbol: 'EURJPY'),
    Bid(up: false, bid: 20, ask: 32, symbol: 'USDEUR'),
    Bid(up: true, bid: 12, ask: 20, symbol: 'CHFUSD'),
    Bid(up: true, bid: 1452, ask: 1500, symbol: 'USDCAD'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: _appBar(),
      body: Container(
        child : Text("dfdsf")
      ), 
    );
  }

  Widget _appBar() {
    return AppBar(
      title: FlatButton(
        onPressed: () {
          // TODO implement callback 
          print("logo pressed");
        }, 
        child: Image.asset(
          'images/logo.png', 
          height: 60.0,
          fit: BoxFit.cover
        )
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(top : 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.white,
                width: 1.0
              ),
            )
          ),
          child: PopupMenuButton<String>(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Menu", style: TextStyle(color: Colors.white),),
                  Icon(Icons.arrow_drop_down, color: Colors.white)
                ],
            ),
            onSelected: (String menuOption) {
              //TODO implement callback on select
              print(menuOption);
            },
            itemBuilder: (BuildContext context) {
              return menuOptions.map((String option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option, style: TextStyle(color: Colors.white),),
                );
              }).toList();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top : 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.white,
                width: 1
              )
            )
          ),
          child: FlatButton(
            onPressed: (){
              // TODO implement callback 
              print("press deposit");
            }, 
            child: Container(
              padding: EdgeInsets.only(left: 5.0, right: 5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.greenAccent)
              ),
              child: Text("Deposit", style: TextStyle(color : Colors.greenAccent, fontSize: 18 )),
            )
          ),
        ),
        Container(
          margin: EdgeInsets.only(top : 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 2.0, right: 2.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.white,
                width: 1
              )
            )
          ),
          child: IconButton(
            icon: Icon(Icons.headset_mic), 
            onPressed: () {
              // TODO implement callback 
              print("tech support press");
            }
          ),
        ),
        Container(
          margin: EdgeInsets.only(top : 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.white,
                width: 1.0
              ),
            )
          ),
          child: PopupMenuButton<String>(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Lang", style: TextStyle(color: Colors.white),),
                  Icon(Icons.arrow_drop_down, color: Colors.white)
                ],
            ),
            onSelected: (String menuOption) {
              //TODO implement callback on select
              print(menuOption);
            },
            itemBuilder: (BuildContext context) {
              return languages.map((Language option) {
                return PopupMenuItem<String>(
                  value: option.name,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(option.pic),
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(option.name, style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                );
              }).toList();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(top : 5.0, bottom: 5.0),
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.white,
                width: 1.0
              ),
            )
          ),
          child: IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: () {
              // TODO implement callback 
              print("press exit");
            }
          ),
        )
      ],
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 0.0,
    );
  }

  Widget _drawer(){
    return(
      Drawer(
        child:  ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 180.0,
              child: _drawerHeader()
            ),
            Container(
              color: Colors.blueGrey[800],
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.all(10.0),
              child: _table(),
            )
          ],
        ),
      )
    );
  }

  Widget _drawerHeader() {
    List<String> showTypes = ['All', 'Fiat', 'Commodities', 'Equities', 'Crypto'];
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PopupMenuButton<String>(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 8.0),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: Colors.white)),
                        ),
                        child: Text("Show: $pickedShowMode", style: TextStyle(color: Colors.white)),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.white)
                    ],
                ),
                onSelected: (String menuOption) {
                  //TODO implement callback on select
                  setState(() {
                    pickedShowMode = menuOption;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return showTypes.map((String option) {
                    return PopupMenuItem<String>(
                      value: option,
                      child: Text(option, style: TextStyle(color: Colors.white)),
                    );
                  }).toList();
                },
              ),
              Expanded(
                child: TextField(
                  onChanged: (String text) {
                    print("change drawer search");
                  },
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search, color: Colors.white),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                  ),
                )
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                color: drawerIntrumentsPicked ? Colors.brown[300] : Colors.transparent,
                onPressed: () {
                  // TODO implement callback
                  print("press intruments");
                  setState(() {
                    drawerIntrumentsPicked = true;
                  });
                }, 
                child: Text("Instruments", style: TextStyle(color: Colors.white),)
              ),
              FlatButton(
                color: drawerIntrumentsPicked ? Colors.transparent : Colors.brown[300],
                onPressed: () {
                  // TODO implement callback
                  print("press favorites");
                  setState(() {
                    drawerIntrumentsPicked = false;
                  });
                }, 
                child: Text("Favorites", style: TextStyle(color: Colors.white))
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800]
      ),
    );
  }

  Widget _table() {
    return(
      Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
        border: TableBorder(
          horizontalInside: BorderSide(color: Colors.black, width: 1)
        ),
        children: _rows(),
      )
    );
  }

  List<TableRow> _rows() {
    TextStyle orangeStyle = TextStyle(color: Colors.orange);
    List<TableRow> finalRows = new List<TableRow>();
    TableRow initialRow = TableRow(
      children: <Widget>[
        Center(
          child: Text('Symbol', style: orangeStyle),
        ),
        Center(
          child: Text('Bid', style: orangeStyle),
        ),
        Center(
          child: Text('Ask', style: orangeStyle),
        ),
      ]
    );
    var rows = drawerBids.map((Bid bid) {
      return TableRow(
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.star, color: Colors.white, size: 14,), 
                    onPressed: () {
                      // TODO implement callback
                      print("press drawer star");
                    }
                  ),
                ),
                Icon(
                  bid.up ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: bid.up ? Colors.greenAccent : Colors.red,
                ),
                Text(bid.symbol, style: TextStyle(color: Colors.white, fontSize: 12),)
              ],
            ),
          ),
          Center(
            child: Text(bid.bid.toString(), style: TextStyle(color: Colors.white)),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(bid.ask.toString(), style: TextStyle(color: Colors.white),),
                IconButton(
                  icon: Icon(Icons.arrow_right, color: Colors.white,), 
                  onPressed: (){
                    // TODO implement callback
                    print('press drawer list arrow');
                  }
                )
              ],
            )
          )
        ]
      );
    });
    finalRows.add(initialRow);
    rows.toList();
    finalRows.addAll(rows);
    finalRows.toList();
    return finalRows;
  }
}
