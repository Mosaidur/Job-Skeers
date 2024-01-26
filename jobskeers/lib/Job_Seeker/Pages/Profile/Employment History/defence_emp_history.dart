import 'package:flutter/material.dart';

class Defence_Employe_History extends StatefulWidget {
  const Defence_Employe_History({super.key});

  @override
  State<Defence_Employe_History> createState() => _Defence_Employe_HistoryState();
}

class _Defence_Employe_HistoryState extends State<Defence_Employe_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Defence Employe History"),

            InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_profile_summary() ));
              },
              child: Icon(Icons.add_comment),
              // Icon(Icons.edit_note_sharp),
            )
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
