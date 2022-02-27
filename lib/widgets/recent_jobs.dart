// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors
import 'package:jobsteer/screens/job_details.dart';
import 'package:jobsteer/screens/screens.dart';

class RecentJobCard extends StatefulWidget {
  late String title,
      companyname,
      tagid1,
      tagid2,
      tagid3,
      daysago,
      location,
      imageurl,
      jobid,
      description;
  RecentJobCard(
      {required this.companyname,
      required this.imageurl,
      required this.title,
      required this.daysago,
      required this.description,
      required this.location,
      required this.tagid1,
      required this.tagid2,
      required this.tagid3,
      required this.jobid});

  @override
  State<RecentJobCard> createState() => _RecentJobCardState();
}

class _RecentJobCardState extends State<RecentJobCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JobDetails(
                    companyname: widget.companyname,
                    description: widget.description,
                    job_id: '',
                    tagid1: widget.tagid1,
                    tagid2: widget.tagid2,
                    thumbnail: widget.imageurl,
                    title: widget.title,
                  )),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        margin: EdgeInsets.only(right: 27.0, left: 27, bottom: 10, top: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: ListTile(
          leading: Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: kBackground,
              borderRadius: BorderRadius.circular(7.0),
              image: DecorationImage(
                image: NetworkImage(widget.imageurl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Container(
            height: 22,
            width: 100,
            child: Expanded(
              child: Text(
                widget.title,
                maxLines: 1,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'GilroyBold',
                    fontSize: 16,
                    letterSpacing: 0.005),
              ),
            ),
          ),

          subtitle: Text(
            widget.companyname,
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'GilroyMedium',
                fontSize: 12,
                letterSpacing: 0.025),
          ),

          trailing: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => JobDetails(
                          companyname: widget.companyname,
                          description: widget.description,
                          job_id: widget.jobid,
                          tagid1: widget.tagid1,
                          tagid2: widget.tagid2,
                          thumbnail: widget.imageurl,
                          title: widget.title,
                        )),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 43,
              width: 115,
              child: Text(
                "Apply Now",
                style: TextStyle(
                    letterSpacing: 0.005,
                    fontFamily: "GilroyBold",
                    fontSize: 14,
                    color: Colors.white),
              ),
              decoration: BoxDecoration(
                  color: Color(0xff000000),
                  borderRadius: BorderRadius.circular(6)),
            ),
          ),

          // trailing: Icon(
          //   Icons.more_vert,
          //   color: kBlack,
          // ),
        ),
      ),
    );
  }
}
