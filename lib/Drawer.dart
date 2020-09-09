import 'package:RMM/Startup/Login%20Page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Screens/Dashboard.dart';
import 'Screens/Docker.dart';
import 'Screens/Help.dart';
import 'Screens/Terminal.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          /* accountEmail: new Text(
            "Gaurav",
            style: TextStyle(color: Colors.black),
          ),
          accountName: new Text(
            "Welcome User",
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
          ),
          currentAccountPicture: new GestureDetector(
            child: new CircleAvatar(
              backgroundImage: new NetworkImage(
                  'https://www.pngkit.com/png/detail/281-2812821_user-account-management-logo-user-icon-png.png'),
            ),
            onTap: () => Fluttertoast.showToast(
                msg: "Your Profile",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.yellowAccent,
                textColor: Colors.black,
                fontSize: 16.0),
          ),*/
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('github logo.png'), fit: BoxFit.fitWidth)),
        ),
        ListTile(
            title: new Text("Execute Commands"),
            leading: FaIcon(FontAwesomeIcons.terminal),
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard()));
            }),
        new ListTile(
            title: new Text("Terminal"),
            leading: FaIcon(FontAwesomeIcons.terminal),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Terminal()));
            }),
        Divider(),
        new ListTile(
            title: new Text("Docker"),
            leading: FaIcon(FontAwesomeIcons.docker),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Docker()));
            }),
        /* new ListTile(
            title: new Text("Kubernetes"),
            leading: FaIcon(FontAwesomeIcons.docker),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Docker()));
            }),*/
        new Divider(),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: ListTile(
              title: new Text("Setup"),
              leading: FaIcon(FontAwesomeIcons.handsHelping),
              onTap: () {
                launch(
                    'https://thesocialcomment.com/blog/Executing-Commands-on-Cloud-VM-s-Remotely-using-Recon-?pid=5f53803737add53a21ad536c');
              }),
        )),
      ],
    ));
  }
}
