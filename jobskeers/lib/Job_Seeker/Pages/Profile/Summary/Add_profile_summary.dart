import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add_profile_summary extends StatefulWidget {
  const Add_profile_summary({super.key});

  @override
  State<Add_profile_summary> createState() => _Add_profile_summaryState();
}

class _Add_profile_summaryState extends State<Add_profile_summary> {

  final TextEditingController profileSummaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Profile Summary"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                SizedBox(height: 20,),

                // Profile Summary
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2000),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Profile Summary can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Profile Summary";
                    }
                  },
                  onChanged: (text) => setState(() {
                    profileSummaryController.text = text;
                  }
                  ),
                  controller: profileSummaryController,
                  maxLines: 15,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Co Curricular Activity*",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff03438C),
                        width: 3,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),


                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff03438C), // Change this color to your desired color
                  ),
                ),

                SizedBox(height: 50),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
