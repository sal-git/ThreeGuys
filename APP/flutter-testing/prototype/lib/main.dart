import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dirty/dirty.dart';
// import 'dart:io';


void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Inventory",
    home: new LoginScreen(),
    )
  );
}

class PaymentEntry {
  PaymentEntry(this.title, [this.children = const <PaymentEntry>[]]);
  final String title;
  final List<PaymentEntry> children;
}

// The entire multilevel list displayed by this app.
final List<PaymentEntry> data = <PaymentEntry>[
  new PaymentEntry('Chapter A',
    <PaymentEntry>[
      new PaymentEntry('Section A0',
        <PaymentEntry>[
          new PaymentEntry('Item A0.1'),
          new PaymentEntry('Item A0.2'),
          new PaymentEntry('Item A0.3'),
        ],
      ),
      new PaymentEntry('Section A1'),
      new PaymentEntry('Section A2'),
    ],
  ),
  new PaymentEntry('Chapter B',
    <PaymentEntry>[
      new PaymentEntry('Section B0'),
      new PaymentEntry('Section B1'),
    ],
  ),
  new PaymentEntry('Chapter C',
    <PaymentEntry>[
      new PaymentEntry('Section C0'),
      new PaymentEntry('Section C1'),
      new PaymentEntry('Section C2',
        <PaymentEntry>[
          new PaymentEntry('Item C2.0'),
          new PaymentEntry('Item C2.1'),
          new PaymentEntry('Item C2.2'),
          new PaymentEntry('Item C2.3'),
        ],
      ),
    ],
  ),
];


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: loginBody(context),
      ),
    );
  }

  loginBody(BuildContext context) => new Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[loginHeader(), loginFields(context)],
  );

  loginHeader() => new Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
//      new FlutterLogo(
//        colors: Colors.blue,
//        size: 80.0,
//      ),
      new Image.asset('assets/chest.png'),
      new SizedBox(
        height: 30.0,
      ),
      new Text(
        "Welcome to Inventory",
        style: new TextStyle(fontWeight: FontWeight.w700, color: Colors.blue),
      ),
      new SizedBox(
        height: 5.0,

      ),
      new Text(
        "Sign in to continue",
        style: new TextStyle(color: Colors.grey),
      ),
    ],
  );

  loginFields(BuildContext context) => new Container(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          child: new TextField(
            maxLines: 1,
            decoration: new InputDecoration(
              hintText: "Enter your username",
              labelText: "Username",
            ),
          ),
        ),
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: new TextField(
            maxLines: 1,
            obscureText: true,
            decoration: new InputDecoration(
              hintText: "Enter your password",
              labelText: "Password",
            ),
          ),
        ),
        new SizedBox(
          height: 30.0,
        ),
        new Container(
          padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          width: double.infinity,
          child: new RaisedButton(
            padding: new EdgeInsets.all(12.0),
            shape: new StadiumBorder(),
            child: new Text(
              "SIGN IN",
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
               context,
               new MaterialPageRoute(builder: (context) => new HomePage()),
             );
            },
          ),
        ),
        new SizedBox(
          height: 5.0,
        ),
        new Text(
          "SIGN UP FOR AN ACCOUNT",
          style: new TextStyle(color: Colors.grey),
        ),
      ],
    ),
  );

}

//class LoginScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Inventory"),
//      ),
//      body: new Container(
//        padding: const EdgeInsets.all(32.0),
//        // child: new Padding(
//        //   padding: new EdgeInsets.all(100.0),
//          child: new Card(
//          elevation: 10.0,
//          child: new Column(
//            mainAxisSize: MainAxisSize.min,
//            children: <Widget>[
//              new TextField(
//                decoration: new InputDecoration(
//                  hintText: 'youremail@somewhere.com',
//                ),
//              ),
//              new TextField(
//                decoration: new InputDecoration(
//                  hintText: 'password',
//                ),
//              ),
//              new ButtonTheme.bar( // make buttons use the appropriate styles for cards
//                child: new ButtonBar(
//                  children: <Widget>[
//                    new FlatButton(
//                      child: const Text('LOGIN'),
//                      onPressed: () {
//                        Navigator.push(
//                          context,
//                          new MaterialPageRoute(builder: (context) => new HomePage())
//                        );
//                      },
//                    ),
//                    new FlatButton(
//                      child: const Text('SIGN UP'),
//                      onPressed: () { /* ... */ },
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          )
//        // ),
//        ) ,
//        // child: new RaisedButton(
//        //   child: new Text("Login"),
//        //   onPressed: () {
//        //     Navigator.push(
//        //       context,
//        //       new MaterialPageRoute(builder: (context) => new HomePage()),
//        //     );
//        //   },
//        // ),
//      )
//    );
//  }
//}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState()  => new HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin  {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final url = "https://images.pexels.com/photos/358636/pexels-photo-358636.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      drawer: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: new Image.asset("assets/chest.png", height: 5.0, width: 5.0,),
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
            ),
            new ListTile(
              title: new Text("Inventory"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            new ListTile(
              title: new Text("Barcode Scanner"),
              onTap: () {
                Navigator.push(
                          context, 
                          new MaterialPageRoute(builder: (context) => new BarcodeReader())
                        ); 
                // Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      // appBar: new AppBar(
      //   title: new Text("Home")
      // ),
      body: new ListView(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
                new Text(""),
                new Text(
                  "Inventory",
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
                new Text(""),
                new IconButton(
                  icon: new Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {

                  },
                ),
                             
              ],
            )
          ),
          new Center(
            child: new Container(
                width: double.INFINITY,
                height: 150.0,
                decoration: new BoxDecoration(
                  color: Colors.blueAccent
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.all(12.0),
                      child: new Center(
                        child: new Text(
                          "3 Items left your inventory today",
                          textScaleFactor: 3.0,
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              ) ,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Colors.blueAccent
            ),
            child: new Padding(
              padding: new EdgeInsets.all(8.0),
              child: tabbedView(),
            ),
          ),
          new Container(
            child: new SizedBox(
              height: 100.0,
              child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                new Card(
                  child: new ListTile(
                    leading: const Icon(Icons.home),
                    title: new TextField(
                      decoration: const InputDecoration(hintText: 'Search for address...'),
                    ),
                  ),
                ),
                new Card(
                  child: new ListTile(
                    leading: const Icon(Icons.location_on),
                    title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                    trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
                  ),
                ),
                ],
              ),
            ),
          )
        ],

      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor:  Colors.blueAccent,
        child: new Icon(Icons.add),
        onPressed: () {  Navigator.push(
                          context, 
                          new MaterialPageRoute(builder: (context) => new NewInventoryItem())
                        );
        },
      ),
    );
  }

//  tabbedContentView() => new TabBarView(
//    controller: _controller,
//    children: <Widget>[
//      new Card(
//        child: new ListTile(
//          leading: const Icon(Icons.home),
//          title: new TextField(
//            decoration: const InputDecoration(hintText: 'Search for address...'),
//          ),
//        ),
//      ),
//      new Card(
//        child: new ListTile(
//          leading: const Icon(Icons.location_on),
//          title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
//          trailing: new IconButton(icon: const Icon(Icons.my_location), onPressed: () {}),
//        ),
//      ),
//    ],
//  );


  tabbedView() => new TabBar(
    controller: _controller,
    tabs: [
      new Tab(
        icon: const Icon(Icons.notifications_active),
        text: 'Notifications',
      ),
      new Tab(
        icon: const Icon(Icons.move_to_inbox),
        text: 'Quick Add',
      ),
    ],
  );

  bubbleMenu() => new Row(
    children: <Widget>[
      new Chip(
          label: new Text("Category"),
          backgroundColor: Colors.white,
      ),
      new Chip(
        avatar: new CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: new Text('C'),
        ),
        label: new Text('Category'),
        backgroundColor: Colors.white,
      )
    ],
  );
}

class BarcodeReader extends StatefulWidget {
  @override
  BarcodeReaderState createState() => new BarcodeReaderState();
}

class BarcodeReaderState extends State<BarcodeReader> {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Inventory"),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) => new PaymentEntryItem(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

class NewInventoryItem extends StatefulWidget {
  @override
  NewInventoryItemState createState() => new NewInventoryItemState();
}

class NewInventoryItemState extends State<NewInventoryItem> {
  
  @override
  Widget build(BuildContext context){
    final Size screenSize = MediaQuery.of(context).size;
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New Inventory Item"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Card(
          child: new Padding(
            padding: new EdgeInsets.all(12.0),
            child: new Column(
              children: <Widget>[
                new Image.asset("assets/photo-camera.png"),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    hintText: "Comic Book #233",
                    labelText: "Item Name"
                  ),
                ),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    hintText: "Comic Book",
                    labelText: "Category"
                  ),
                ),
                new TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    hintText: "3",
                    labelText: "QTY"
                  ),
                ),
                new Container(
                  width: screenSize.width,
                  child: new RaisedButton(
                    child: new Text(
                      'ENTER',
                      style: new TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: () => null,
                    color: Colors.blueAccent,
                  ),
                  margin: new EdgeInsets.only(
                    top: 20.0
                  ),
                )
              ],
            ),
          )
        ),
      )
    );
  }
}

class PaymentEntryItem extends StatelessWidget {
  const PaymentEntryItem(this.entry);

  final PaymentEntry entry;

  Widget _buildTiles(PaymentEntry root){
    if (root.children.isEmpty)
      return new ListTile(title: new Text(root.title));
    return new ExpansionTile(
      key: new PageStorageKey<PaymentEntry>(root),
      title: new Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

   @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}