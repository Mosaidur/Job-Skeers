import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../loading_page.dart';
import 'AboutEventPage.dart';

class EventPage extends StatefulWidget {
  bool backIcon;
  EventPage({Key? key, this.backIcon=false}) : super(key: key);


  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<Map<String, dynamic>> eventDetails = [
    {
      'EventID' : '1',
      'Date': '10 May 2024',
      'Time': '5:00 pm',
      'Week': 'FRIDAY',
      'EventImage': 'assets/images/event Cover page .jpg',
      'EventTitle': 'Event Title',
      'EventLocation': 'Event Location',
      'EventFaceBookLink' : 'https://www.facebook.com/share/qumFHw8a7qtYXcmj/?mibextid=9VsGKo',
    },
    {
      'EventID' : '2',
      'Date': '11 May 2024',
      'Time': '4:00 pm',
      'Week': 'SaturnDAY',
      'EventImage': 'assets/images/event Cover page .jpg',
      'EventTitle': 'Event Title',
      'EventLocation': 'Event Location',
      'EventFaceBookLink' : 'https://www.facebook.com/share/qumFHw8a7qtYXcmj/?mibextid=9VsGKo',
    },
    {
      'EventID' : '1',
      'Date': '10 May 2024',
      'Time': '5:00 pm',
      'Week': 'FRIDAY',
      'EventImage': 'assets/images/event Cover page .jpg',
      'EventTitle': 'Event Title',
      'EventLocation': 'Event Location',
      'EventFaceBookLink' : 'https://www.facebook.com/share/qumFHw8a7qtYXcmj/?mibextid=9VsGKo',
    },
    {
      'EventID' : '2',
      'Date': '11 May 2024',
      'Time': '4:00 pm',
      'Week': 'SaturnDAY',
      'EventImage': 'assets/images/event Cover page .jpg',
      'EventTitle': 'Event Title',
      'EventLocation': 'Event Location',
      'EventFaceBookLink' : 'https://www.facebook.com/share/qumFHw8a7qtYXcmj/?mibextid=9VsGKo',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar:  AppBar(
        title: (widget.backIcon !=false) ? Text("Event")  : Center(child: Text("Event")),
        // leadingWidth: (widget.backIcon !=false) ? 0: null,
        // automaticallyImplyLeading: (widget.backIcon !=false) ? false : true,
        leading: (widget.backIcon !=false) ? IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ) : null,
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: eventDetails.map((event) {

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell( onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutEventPage(eventID: event['EventID'],) ));
                },

                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                            ),
                          ),
                          child: AspectRatio(
                            aspectRatio: 19 / 9,
                            child: Image.asset(
                              event['EventImage']!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 15, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${event['Week'].toString()}, ${event['Date'].toString()} AT ${event['Time'].toString()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 10),

                              //Event Title
                              Text(
                                event['EventTitle']!.toString(),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),

                              SizedBox(height: 10),

                              //Event Location
                              Text(
                                event['EventLocation']!.toString(),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey.shade700,
                                ),
                              ),

                              SizedBox(height: 5,),

                              Center(
                                child: ElevatedButton(
                                    onPressed: ()async {

                                      final url = Uri.parse(event['EventFaceBookLink']);
                                      LoadingPage();
                                      if (await launchUrl(
                                        url,
                                        mode: LaunchMode.externalApplication,
                                      )) {
                                        throw Exception('Could not launch $url');
                                      }

                                    },

                                    child: Text("Interested")
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
