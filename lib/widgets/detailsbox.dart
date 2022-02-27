// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:jobsteer/screens/screens.dart';

class DetailBox extends StatelessWidget {
  const DetailBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 354,
      width: 374,
      child: Neumorphic(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 1,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Text(
                  details,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "GilroyMedium",
                      fontSize: 16),
                ),
              );
            }),
        style: NeumorphicStyle(
            shadowDarkColorEmboss: Colors.black,
            surfaceIntensity: 10,
            depth: -5,
            intensity: 0.60,
            color: kBackground,
            shape: NeumorphicShape.convex),
      ),
    );
  }
}

//

String details =
    """Currently hiring part-time baristas, with potential to grow into a full-time position, for a coffee and cocktail bar located in the Financial District. We are seeking knowledgeable and experienced baristas for our coffee program, to assist customers with consistently efficient and warm service, craft balanced quality Parlor Coffee drinks, and create a neighborhood spot for commuters and residents alike.

Duties & Responsibilities to Include:
• Preparing specialty beverages and maintaining quality control, in accordance with the standards of third-wave espresso, coffee, and tea service; occasional coffee-cocktail, beer, and wine service
• Assisting in cash-handling, customer transactions, stocking, cleaning and clearing, and other general café duties
• Providing excellent service, equipped with knowledge of the product and establishing the customer experience
• Creating an inclusive environment for customers and co-workers alike
• Maintaining a clean and organized workspace, both... behind the bar and front of house
• Following health and safety guidelines for all spaces, products, and equipment
• Opening the café and assisting in the transition to evening service

Position Requirements:
• Minimum 1-year experience as a specialty coffee barista; NYC service experience preferable
• Ability to dial in espresso, and sufficient experience on a La Marzocco or equivalent espresso machines
• Excellent work ethic and communication skills
• Ability to multi-task, prioritize, and work independently in all café positions
• Respectful, detail-oriented, and reliable personality
• Must be able to occasionally lift and move 50 lbs. minimum and climb stairs
• Ownership of NYC Food Handlers Card (or willing to obtain one after hire)
• Must be able to work a minimum of two shifts a week, have availability on weekends, and pick up/cover shifts if needed

If interested, please send your resume as an attachment to info@spliteightsnyc.com, as well as any pertinent information about yourself, your schedule, and your experience in specialty coffee.

We look forward to hearing from you""";
