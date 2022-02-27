// ignore_for_file: prefer_const_constructors

import 'package:jobsteer/screens/screens.dart';

class Buildbackbutton extends StatelessWidget {
  const Buildbackbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        },

        child: ImageIcon(
          AssetImage("assets/images/back.png"),
          size: 10,
        ), //angle-left
      ),
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: kBackground,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
