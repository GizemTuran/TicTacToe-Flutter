import 'package:flutter/material.dart';
import 'package:tictactoe/players_info.dart';

class GamePanel extends StatefulWidget {
  const GamePanel(
      {Key? key,
      required this.player1,
      required this.player2,
      required this.winnerList})
      : super(key: key);
  final String player1;
  final String player2;
  final List<List<String>> winnerList;
  @override
  State<GamePanel> createState() => _GamePanelState();
}

class _GamePanelState extends State<GamePanel> {
  int score1 = 0;
  int score2 = 0;
  int j = 0;
  bool click = true;
  var List = ["", "", "", "", "", "", "", "", ""];
  int round = 1;
  int order = 1;
  String user1 = "X";
  String user2 = "O";

  void playerTaps(int index) {
    //index 1den başlar.
    if (List[index].isEmpty) {
      if (click && order % 2 == 1) {
        print(user1);
        List[index] = "X";
        order++;
        print(List);
      } else {
        print(user2);
        List[index] = "O";
        order++;
        print(List);
      }
    }
  }

  void Win() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title:
                Text("Congratulations!!! ${widget.player1} won (+ 3 points)"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  widget.winnerList
                      .add([widget.player1, "X", score1.toString()]);
                  Navigator.of(context).pop();
                  setState(() {
                    List = ["", "", "", "", "", "", "", "", ""];
                    order = 1;
                  });
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  void Win2() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title:
                Text("Congratulations!!! ${widget.player2} won (+ 3 points)"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  widget.winnerList
                      .add([widget.player2, "O", score2.toString()]);
                  Navigator.of(context).pop();
                  setState(() {
                    List = ["", "", "", "", "", "", "", "", ""];
                    order = 2;
                  });
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  void Draw() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Draw!"),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    List = ["", "", "", "", "", "", "", "", ""];
                    order = 1;
                  });
                },
                child: Text("OK"),
              ),
            ],
          );
        });
  }

  void Exit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Are you sure to exit?"),
            content: Row(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlayersInfo(
                                winnerList: widget.winnerList,
                              )),
                    );
                    setState(() {
                      List = ["", "", "", "", "", "", "", "", ""];
                      order = 2;
                    });
                  },
                  child: Text("Yes"),
                ),
                SimpleDialogOption(
                  onPressed: (() => Navigator.of(context).pop()),
                  child: Text("No"),
                ),
              ],
            ),
          );
        });
  }

  void gameResult() {
    if (List[0] == List[1] && List[1] == List[2] && List[0] != "") {
      if (order % 2 == 1) {
        print("User2 won!");
        score2 += 3;
        round++;
        Win2();
        return;
      } else {
        score1 += 3;
        print("User1 won!");
        round++;
        Win();
        return;
      }
    }
    if (List[3] == List[4] && List[4] == List[5] && List[3] != "") {
      if (order % 2 == 1) {
        print("User2 won!");
        score2 += 3;
        round++;
        Win2();
        return;
      } else {
        print("User1 won!");
        score1 += 3;
        round++;
        Win();
        return;
      }
    }
    if (List[6] == List[7] && List[7] == List[8] && List[6] != "") {
      if (order % 2 == 1) {
        print("User2 won!");
        score2 += 3;
        round++;
        Win2();
        return;
      } else {
        print("User1 won!");
        score1 += 3;
        round++;
        Win();
        return;
      }
    }
    if (List[2] == List[4] && List[4] == List[6] && List[2] != "") {
      if (order % 2 == 1) {
        print("User2 won!");
        score2 += 3;
        round++;
        Win2();
        return;
      } else {
        print("User1 won!");
        score1 += 3;
        round++;
        Win();
        return;
      }
    }
    if (List[0] == List[4] && List[4] == List[8] && List[0] != "") {
      if (order % 2 == 1) {
        print("User2 won!");
        score2 += 3;
        round++;
        Win2();
        return;
      } else {
        print("User1 won!");
        score1 += 3;
        round++;
        Win();
        return;
      }
    }
    if (List[0] == List[3] && List[3] == List[6] && List[0] != "") {
      if (order % 2 == 1) {
        print("User2 won!");
        score2 += 3;
        round++;
        Win2();
        return;
      } else {
        print("User1 won!");
        score1 += 3;
        round++;
        Win();
        return;
      }
    }
    if (List[1] == List[4] && List[4] == List[7] && List[1] != "") {
      if (order % 2 == 1) {
        print("User2 won!");
        score2 += 3;
        round++;
        Win2();
        return;
      } else {
        print("User1 won!");
        score1 += 3;
        round++;
        Win();
        return;
      }
    }
    if (List[2] == List[5] && List[5] == List[8] && List[2] != "") {
      if (order % 2 == 1) {
        print("User2 won!");
        score2 += 3;
        round++;
        Win2();
        return;
      } else {
        print("User1 won!");
        score1 += 3;
        round++;
        Win();
        return;
      }
    }
    if (!List.contains("")) {
      print("Tie");
      score1 += 1;
      score2 += 1;
      round++;
      Draw();
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Panel", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Text(
                widget.player1 + " Score: " + score1.toString(),
                //score1,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Text(
            widget.player2 + " Score: " + score2.toString(),
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Text(
            "Round: " + round.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text("Turn: "),
                Text(
                  order % 2 == 1
                      ? "${widget.player1} (X)"
                      : "${widget.player2} (O)",
                  style: TextStyle(
                      color: order % 2 == 1 ? Colors.blue : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 400,
              width: 400,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (_, index) => InkWell(
                  onTap: (() {
                    setState(() {});
                    playerTaps(index);
                    gameResult();
                  }),
                  child: Container(
                    child: Center(
                      child: Text(
                        //index.toString(),
                        List[index],
                        style: TextStyle(
                            color:
                                List[index] == "X" ? Colors.blue : Colors.red,
                            fontSize: 90),
                      ),
                    ),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                  ),
                ),
                itemCount: 9,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      List = ["", "", "", "", "", "", "", "", ""];
                      score1 = 0;
                      score2 = 0;
                      order = 1;
                      round = 1;
                      setState(() {});
                    },
                    child: const Text("Reset")),
                ElevatedButton(
                    onPressed: () => {
                          Exit(),
                        },
                    child: const Text("Exit")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
