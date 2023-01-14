import 'package:flutter/material.dart';
import 'package:tictactoe/players_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome to TTT',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/background.png',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 140, 8, 0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 0, left: 115, right: 115),
                    alignment: Alignment.center,
                    child: Image.asset("assets/words.png"),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 330),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Text(
                          "V 1.0",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: TextButton(
                child: Text(
                  "Continue >>",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => PlayersInfo(
                                winnerList: [],
                              ))));
                }),
          ),
        ],
      ),
    );
  }
}
