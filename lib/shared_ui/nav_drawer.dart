import 'package:flutter/material.dart';
import 'package:news_app/screens/apple.dart';
import 'package:news_app/screens/bitcoin.dart';
import 'package:news_app/screens/business.dart';
import 'package:news_app/screens/home.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  //String currentProfilePic = "images/1.jpg";
  //String otherProfilePic = "https://yt3.ggpht.com/-2_2skU9e2Cw/AAAAAAAAAAI/AAAAAAAAAAA/6NpH9G8NWf4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg";

  /*void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
  }*/

  @override
  Widget build(BuildContext context) {

    return Drawer(


      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            //accountEmail: new Text("bramvbilsen@gmail.com"),
            //    accountName: new Text(auth.userData.name),
          //  accountName: new Text('amal'),
            currentAccountPicture: new GestureDetector(
              child: new Container (
                // backgroundImage: new NetworkImage(currentProfilePic),
               // backgroundImage: new ExactAssetImage('images/1.jpg'),
                child: Image.network(
                  'data:image/jpeg;base64,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',
                ),
              ),
              onTap: () => print("This is your current account."),
            ),
            otherAccountsPictures: <Widget>[
              new GestureDetector(


              /*  child: new CircleAvatar(
                  // backgroundImage: new NetworkImage(otherProfilePic),
                  backgroundImage: new ExactAssetImage('images/4.jpg'),
                ),*/
               // onTap: () => switchAccounts(),
              ),
            ],
        /*    decoration: new BoxDecoration(
                image: new DecorationImage(

               //   image:  ExactAssetImage('images/3.jpg'),
                  fit: BoxFit.cover,
                  //  fit: BoxFit.fill
                )
            ),*/
          ),





          new ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }
          ),
          new ListTile(
              title: new Text("Business"),
              trailing: new Icon(Icons.business),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Business()),
                );
              }
          ),
          new ListTile(
              title: new Text("Bitcoin"),
              trailing: new Icon(Icons.attach_money),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bitcoin()),
                );
              }
          ),
          new ListTile(
              title: new Text("Apple"),
              trailing: new Icon(Icons.flag),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Apple()),
                  // onTap: () => Navigator.pop(context),
                );
              }
          ),
          new Divider(),
          new ListTile(
            title: new Text("Cancel"),
            trailing: new Icon(Icons.cancel),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),


    );
  }
}
