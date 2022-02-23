import 'package:flutter/material.dart';
import 'package:my_puzzle/src/domain/models/tile.dart';
import 'package:image/image.dart' as imglib;

class PuzzleTile extends StatelessWidget {
  final Tile tile;
  final double size;
  final VoidCallback onTap;
  const PuzzleTile({
    Key? key,
    required this.tile,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(
        milliseconds: 200,
      ),
      left: (tile.position.x - 1) * size,
      top: (tile.position.y - 1) * size,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          
          // decoration: BoxDecoration(
          //   // color: const Color(0xff507DBC),
          //   image: new DecorationImage(
          //     image: new AssetImage(tile.image),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          
          // decoration: BoxDecoration(
          //   border: Border.all(color: Color(0xffa1c6ea), width: 0),
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(10.0) 
          //   ),
          //   color: const Color(0xff507DBC), ///////////
          // ),
          margin: const EdgeInsets.all(1),
          width: size - 2,
          height: size - 2,
          alignment: Alignment.center,
          child: Text(
            tile.value.toString(),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}
