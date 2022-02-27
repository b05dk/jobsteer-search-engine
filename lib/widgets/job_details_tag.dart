// ignore_for_file: prefer_const_constructors

import "package:jobsteer/screens/screens.dart";

class DetailsTag extends StatelessWidget {
  final String tagid;
  const DetailsTag({Key? key, required this.tagid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Neumorphic(
        child: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Expanded(
            child: Text(
              tagid,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: "GilroyMedium",
                  color: Color(0xffF9D3B4)),
            ),
          ),
        ),
        style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          // lightSource: LightSource.left,
          intensity: 0.30,
          color: kBackground,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
        ),
      ),
      height: 32,
      width: 82,
      decoration: BoxDecoration(
          color: kBackground,
          border: Border.all(color: Color(0xff212426), width: 1),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
