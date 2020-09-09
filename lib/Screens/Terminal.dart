import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Terminal extends StatefulWidget {
  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _c;
    var op = " ";
    var msgLine = " ";
    String commandName = " ";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1e1e1e),
      ),
      body: Container(
        color: Color(0xFF1e1e1e),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "user@terminal:~ ",
                      style: TextStyle(color: Color(0xFF266de4)),
                    ),
                    Expanded(
                      child: TextField(
                          autofocus: true,
                          showCursor: true,
                          cursorColor: Colors.white,
                          cursorWidth: 6,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          decoration: InputDecoration.collapsed(hintText: ""),
                          onChanged: (x) {
                            commandName = x;
                          },
                          onSubmitted: (x) async {
                            print("done");
                            var url =
                                "http://54.160.88.233/cgi-bin/rmm.py?x=$commandName";
                            var result = await http.get(url);
                            var data = result.body;
                            setState(() {
                              op = data;
                              data = op;
                              print(op);
                            });
                          }),
                    )
                  ],
                ),
                /* Container(
                  width: 500,
                  color: Colors.black,
                  child: Text(
                    'cmd : $op',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
