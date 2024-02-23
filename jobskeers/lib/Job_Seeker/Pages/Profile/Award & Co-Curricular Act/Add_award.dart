import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add_Award extends StatefulWidget {
  const Add_Award({super.key});

  @override
  State<Add_Award> createState() => _Add_AwardState();
}

class _Add_AwardState extends State<Add_Award> {

  final TextEditingController awardTitleController = TextEditingController();
  final TextEditingController dateOfReceivedAwardController = TextEditingController();
  final TextEditingController reasonForAwardController = TextEditingController();
  final TextEditingController contextOfAwardController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Award"),
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
