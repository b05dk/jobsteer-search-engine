// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:jobsteer/screens/screens.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          width: double.infinity,
          height: 12,
          child: Image(image: AssetImage("assets/images/Divider.png"))),
    );
  }
}
