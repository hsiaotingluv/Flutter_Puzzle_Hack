import 'package:flutter/material.dart';
import 'package:my_puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:my_puzzle/src/ui/utils/time_parser.dart';
import 'package:provider/provider.dart';

class TimeAndMoves extends StatelessWidget {
  const TimeAndMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<GameController>();
    final state = controller.state;
    final time = Provider.of<GameController>(context, listen: false).time;
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: time,
          builder: (_, time, icon) {
            return Row(
              children: [
                icon!,
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 30, 20, 30),
                    child:
                        Text(parseTime(time), style: TextStyle(fontSize: 20))),
              ],
            );
          },
          child: const Icon(
            Icons.timer,
          ),
        ),
        Container(
            padding: const EdgeInsets.all(10.0),
            //color: Color(0xff507DBC),
            // decoration: BoxDecoration(
            //     color: Color(0xff507DBC),
            //     border: Border.all(
            //       color: Color(0xff507DBC),
            //     ),
            //     borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Selector<GameController, int>(
              builder: (_, moves, __) {
                return Text("Moves: $moves",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gotham',
                        fontWeight: FontWeight.bold));
              },
              selector: (_, controller) => controller.state.moves,
            )),
        DropdownButton<int>(
          items: [3, 4, 5, 6]
              .map(
                (e) => DropdownMenuItem(
                  child: Text("${e}x$e", style: TextStyle(fontSize: 20)),
                  value: e,
                ),
              )
              .toList(),
          onChanged: (crossAxisCount) {
            if (crossAxisCount != null &&
                crossAxisCount != state.crossAxisCount) {
              controller.changeGrid(crossAxisCount);
            }
          },
          value: state.crossAxisCount,
        ),
        const SizedBox(height: 10),
      ],
    ));
  }
}
