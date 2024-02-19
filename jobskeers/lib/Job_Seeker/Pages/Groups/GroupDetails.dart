import 'package:flutter/material.dart';

class GroupDetails extends StatefulWidget {
  String GroupID;
  GroupDetails({super.key, required this.GroupID});

  @override
  State<GroupDetails> createState() => _GroupDetailsState();
}

class _GroupDetailsState extends State<GroupDetails> {

  String Groupimage = "assets/images/cdc_logo.png";
  String GroupName = "CDC Job Group";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SingleChildScrollView(
        child: Stack(
          // alignment: AlignmentDirectional.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Back Arrow
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Color(0xff03438C)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                  //
                  PopupMenuButton(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    iconSize: 28,
                    color: Colors.blueGrey.shade100,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: (){
                          // showDialog(context: context, builder: builder)
                        },
                        value: 1,
                        child: Text(
                          "Create New Group",
                          style: TextStyle (
                              fontWeight: FontWeight.w500,
                              fontSize: 12
                          ),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
            Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 80,),

                  Container(
                    width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(Groupimage)),

                  SizedBox(height: 15,),

                  Text(
                    GroupName,
                    maxLines: 3,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )



                    ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
