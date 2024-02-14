import 'package:flutter/material.dart';
import 'package:jobskeers/Job_Seeker/Pages/Groups/widgets/GroupTitle.dart';

import 'GroupChat.dart';

class AllGroupPage extends StatefulWidget {
  const AllGroupPage({super.key});

  @override
  State<AllGroupPage> createState() => _AllGroupPageState();
}

class _AllGroupPageState extends State<AllGroupPage> {

  TextEditingController GroupNameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar:  AppBar(
        title: Text("Groups"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ) ,
        actions: [
          PopupMenuButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          iconSize: 28,
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
                    fontSize: 17
                  ),
                ),
            ),
          ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            //SearchBar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: GroupNameTextEditingController,
                decoration: InputDecoration(
                  // labelText: 'Group Name', // Add a label for the text field
                  hintText: 'Search group',
                  prefixIcon: Icon(Icons.search),// Add a hint to guide the user
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                ),
              ),
            ),

            for (int i =0 ; i<10;i++)
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CroupChat() ));
              },
              child: Grouptitle(
                GroupName: 'CDC JOB ADVICE',
                GroupBio: 'JOB ADVICE',
                // GroupImage: "",
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
