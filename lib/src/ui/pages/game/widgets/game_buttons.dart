import 'package:flutter/material.dart';
import 'package:my_puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:my_puzzle/src/ui/pages/game/controller/game_state.dart';
import 'package:provider/provider.dart';

class GameButtons extends StatelessWidget {
  const GameButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final state = controller.state;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
          child: ElevatedButton(
            // padding: const EdgeInsets.all(20),
            // textColor: Colors.white,
            onPressed: controller.shuffle,
            child: Text(
              state.status == GameStatus.created ? "START" : "RESET",
              style: TextStyle(fontSize: 20),
              
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(240, 50),
              primary: Color(0xfff15025),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // <-- Radius
              ),
              padding: const EdgeInsets.all(10),
            ),
          )
          ),
          const SizedBox(width: 20),
         
        ],
      ),
    );
  }
}
