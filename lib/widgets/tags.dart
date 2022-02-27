// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:jobsteer/screens/screens.dart';

class Tags extends StatelessWidget {
  final String tag_name;
  const Tags({Key? key, required this.tag_name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Expanded(
          child: Text(
            tag_name,
            maxLines: 1,
            style: TextStyle(
                fontFamily: "GilroyMedium",
                fontSize: 12,
                color: Color(0xffD9896A)),
          ),
        ),
      ),
      height: 29,
      width: 90,
      decoration: BoxDecoration(
          color: Color(0xffFDEDE1), borderRadius: BorderRadius.circular(4)),
    );
  }
}
