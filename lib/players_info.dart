import 'package:flutter/material.dart';

import 'game_panel.dart';

class PlayersInfo extends StatefulWidget {
  const PlayersInfo({Key? key, required this.winnerList}) : super(key: key);
  final List<List<String>> winnerList;
  @override
  State<PlayersInfo> createState() => _PlayersInfoState();
}

class _PlayersInfoState extends State<PlayersInfo> {
  String player1 = "";
  String player2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Players Panel", style: TextStyle(color: Colors.black)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GamePanel(
                        player1: player1,
                        player2: player2,
                        winnerList: widget.winnerList,
                      )));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.forward),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Material(
                    shadowColor: Colors.black,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(Icons.account_box),
                      subtitle: Text("Player 1"),
                      //tileColor: Colors.white.withOpacity(1.0),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                      title: TextField(
                        onChanged: (text) {
                          player1 = text;
                        },
                        decoration: InputDecoration(hintText: ''),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.white.withOpacity(0.5)),
                        /*side: BorderSide(
                            color: const Color.fromRGBO(255, 255, 255, 0.5))*/
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Icon(Icons.height),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Material(
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.account_box),
                        subtitle: Text("Player 2"),
                        //tileColor: Colors.white.withOpacity(1.0),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.red,
                        ),
                        title: TextField(
                          onChanged: (text2) {
                            player2 = text2;
                          },
                          decoration: InputDecoration(hintText: ''),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side:
                              BorderSide(color: Colors.white.withOpacity(0.5)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Heros List:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Container(
                  height: 300,
                  width: 300,
                  child: ListView.builder(
                    itemCount: widget.winnerList.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        onDismissed: (direction) {
                          setState(() {
                            widget.winnerList.removeAt(index);
                          });
                        },
                        background: Container(
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        key: ValueKey<int>(index),
                        child: ListTile(
                          title: Text(widget.winnerList[index][0]),
                          leading:
                              Icon(Icons.star, size: 28, color: Colors.amber),
                          trailing: Text(widget.winnerList[index][2]),
                          subtitle: widget.winnerList[index][1] == "X"
                              ? Text(
                                  "X",
                                  style: TextStyle(color: Colors.blue),
                                )
                              : Text(
                                  "O",
                                  style: TextStyle(color: Colors.red),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
