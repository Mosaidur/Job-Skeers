import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../customDialogBox.dart';
import 'award.dart';

class Edit_Award extends StatefulWidget {
  const Edit_Award({super.key});

  @override
  State<Edit_Award> createState() => _Edit_AwardState();
}

class _Edit_AwardState extends State<Edit_Award> {

  final TextEditingController awardTitleController = TextEditingController(text: "");
  final TextEditingController dateOfReceivedAwardController = TextEditingController(text: "");
  final TextEditingController reasonForAwardController = TextEditingController(text: "");
  final TextEditingController contextOfAwardController = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Edit Award"),

              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_language_prof ()));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          CustomDialogBox(
                            message: 'Are you sure you want to delete?',
                            bgcolors: Colors.white,
                            title: 'Delete',
                            pageLink: AwardDetails(),
                          )
                  );
                },
                child: Icon(Icons.delete),
              ),
            ],
          ),
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

                // Award Title
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Award Title can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Award Title";
                    }
                  },
                  onChanged: (text) => setState(() {
                    awardTitleController.text = text;
                  }
                  ),
                  controller: awardTitleController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Award Title*",
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

                //Award Receiving Year
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Award Receiving Year can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Award Receiving Year";
                    }
                  },
                  onChanged: (text) => setState(() {
                    dateOfReceivedAwardController.text = text;
                  }
                  ),
                  controller: dateOfReceivedAwardController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Topic Covered*",
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

                //Reason For Award
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Reason For Award can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Reason For Award";
                    }
                  },
                  onChanged: (text) => setState(() {
                    reasonForAwardController.text = text;
                  }
                  ),
                  controller: reasonForAwardController,
                  maxLines: 3,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Reason For Award*",
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

                // Context Of Award
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Context Of Award can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Context Of Award";
                    }
                  },
                  onChanged: (text) => setState(() {
                    contextOfAwardController.text = text;
                  }
                  ),
                  controller: contextOfAwardController,
                  maxLines: 6,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Context Of Award*",
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
