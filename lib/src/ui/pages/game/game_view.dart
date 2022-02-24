import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_puzzle/src/ui/pages/game/controller/game_controller.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/game_buttons.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/puzzle_interactor.dart';
import 'package:my_puzzle/src/ui/pages/game/widgets/time_and_moves.dart';
import 'package:my_puzzle/src/ui/utils/time_parser.dart';
import 'package:provider/provider.dart';

class GameView extends StatelessWidget {
  final List<int> imageList;
  const GameView({Key? key, required this.imageList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = GameController(imageList);
        controller.onFinish.listen(
          (_) {
            Timer(
              const Duration(
                milliseconds: 200,
              ),
              () {
                _showWinnerDialog(context, controller);
              },
            );
          },
        );
        return controller;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffadd8f2),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/resources/logo.png',
                height: 80,
              ),
              const TimeAndMoves(),
              const Padding(
                padding: EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PuzzleInteractor(),
                ),
              ),
              const GameButtons(),
            ],
          ),
        ),
      ),
    );
  }

  void _showWinnerDialog(
    BuildContext context,
    GameController controller,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("GREAT JOB"),
            Text("moves: ${controller.state.moves}"),
            Text("time: ${parseTime(controller.time.value)}"),
            const SizedBox(height: 20),
            TextButton(
              child: const Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
