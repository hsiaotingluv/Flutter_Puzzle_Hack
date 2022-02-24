import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_puzzle/src/ui/pages/game/game_view.dart';
import 'src/loading.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  Future<List<int>> _getUiImage(String path) async {
    final ByteData assetImageByteData = await rootBundle.load(path);
    return assetImageByteData.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    final timer = Future.delayed(const Duration(seconds: 2));
    timer.then((value) => {
          _getUiImage('lib/resources/SoCCat1.jpg').then((image) =>
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return GameView(imageList: image);
              })))
        });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.asset('lib/resources/logo.png', fit: BoxFit.contain),
            ),
            const SizedBox(height: 24.0),
            Loading(),
          ],
        ),
      ),
    );
  }
}
