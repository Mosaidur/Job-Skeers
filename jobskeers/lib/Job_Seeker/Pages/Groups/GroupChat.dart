import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jobskeers/Job_Seeker/Pages/Groups/widgets/Grp_Others_ChatTextBox.dart';
import 'package:jobskeers/Job_Seeker/Pages/Groups/widgets/MyChatTextBox.dart';

import 'GroupDetails.dart';

class CroupChat extends StatefulWidget {
  String? GroupID;
  CroupChat({super.key,
    this.GroupID,});

  @override
  State<CroupChat> createState() => _CroupChatState();
}

class _CroupChatState extends State<CroupChat> {

  String Groupimage ="assets/images/cdc_logo.png";

  TextEditingController MeessageTextEditingController = TextEditingController();


  List<Map<String, dynamic>> messages = [
    {
      'chatboxColor': null,
      'TimeStamp': '',
      'Massage': '',
      'SenderName': '',
      'SenderImage': '',
    },
    {
      'chatboxColor': Colors.blue,
      'TimeStamp': '9:00 AM',
      'Massage': 'Hello!',
      'SenderName': 'John',
      'SenderImage': 'assets/john_profile.jpg',
    },
    // Add more messages as needed
  ];




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  child: Image.asset(Groupimage)),

              SizedBox(width: 10,),
              Text("Group Name"),
            ],
          ),
            // leadingWidth: 20,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ) ,
          actions: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> GroupDetails(GroupID: '1',)));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Icon(Icons.info, color: Colors.white,),
              ),
            )
          ],
        ),

        body: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        //Sender massage
                        // for (int i= 0; i<3;i++)
                          SenderChatMassage(
                            // chatboxColor: null,
                            // Textcolor: null,
                            sender: true,
                            TimeStamp: '9:00 AM',
                            Massage: 'Hello!',
                            SenderName: 'John',
                            SenderImage: (Groupimage == null) ? "assets/images/cdc_logo.png" : Groupimage  ,
                          ),

                
                        //Reciever masage
                        // for (int i= 0; i<3;i++)
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Message Options"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: Text("Edit"),
                                        onTap: () {
                                          // Perform edit action here
                                          Navigator.pop(context); // Close the dialog
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Delete"),
                                        onTap: () {
                                          // Perform delete action here
                                          Navigator.pop(context); // Close the dialog
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8, left: 15, right: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [

                                MyChatTextBox(
                                  Massage: 'Hello!',
                                  sender: false,
                                  TimeStamp: '9:00 AM',
                                ),


                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.message,
                      color: Color(0xff03438C),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: MeessageTextEditingController,
                        maxLines: 6,
                        minLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Message',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send_rounded,
                          color: Color(0xff03438C)),
                      onPressed: () {
                        // Implement sending logic here
                      },
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
        // bottomNavigationBar:
      ),
    );
  }
}
