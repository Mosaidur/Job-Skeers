import 'package:flutter/cupertino.dart';

class Grouptitle extends StatefulWidget {
  final String GroupName;
  final String GroupBio;
  final String GroupImage ;

  const Grouptitle({super.key,
    required this.GroupName,
    required this.GroupBio,
    this.GroupImage = "assets/images/cdc_logo.png"
  });

  @override
  State<Grouptitle> createState() => _GrouptitleState();
}

class _GrouptitleState extends State<Grouptitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffffffff)
                ),
                child: Image.asset(widget.GroupImage,
                fit: BoxFit.cover,
                )
            ),
          ),

          // Group Bio and group name
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    widget.GroupName,
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8,),

                Text(
                  widget.GroupBio,
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
