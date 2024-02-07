import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../loading_page.dart';

class AboutEventPage extends StatefulWidget {
    AboutEventPage({Key? key, required this.eventID}) ;
   String eventID ;

  @override
  State<AboutEventPage> createState() => _AboutEventPageState();
}

class _AboutEventPageState extends State<AboutEventPage> {

  String Date= "10 May 2024" ;
  String Time = "5:00 pm" ;
  String Week = "FRIDAY" ;
  String EventImage = "assets/images/event Cover page .jpg";
  String EventTitle ="Event Title";
  String EventLocation = "Event Location";
  String EventFaceBookLink = "https://www.facebook.com/share/qumFHw8a7qtYXcmj/?mibextid=9VsGKo";
  String EventDescription = "Daffodil International University Daffodil International University";
  String EventOrganizer = "Daffodil International University " ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print (widget.eventID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                    ),
                  ),
                  child: Image.asset(
                    EventImage,
                    fit: BoxFit.fitHeight,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10,30,0,0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ]
            ),


            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Text(
                    "$Week, $Date AT $Time",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 10),

                  //Event Title
                  Text(
                    EventTitle,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),

                  SizedBox(height: 10),

                  //Event organizer
                  Text(
                    "Event by $EventOrganizer",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  SizedBox(height: 10,),
                  // Event Location
                  Text(
                    "Event location $EventLocation",
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  SizedBox(height: 10,),

                  InkWell(
                    onTap: ()async {

                      final url = Uri.parse(EventFaceBookLink);
                      LoadingPage();
                      if (await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw Exception('Could not launch $url');
                      }
                    },
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      width: double.maxFinite,
                      height: 30,
                      decoration: BoxDecoration(
                        color:  Color(0xff03438C),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                          "Interested",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),

                  // EventDescription
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      EventDescription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: ,
    );
  }
}
