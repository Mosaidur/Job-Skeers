import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add_Experience_summary extends StatefulWidget {
  const Add_Experience_summary({super.key});

  @override
  State<Add_Experience_summary> createState() => _Add_Experience_summary();
}

class _Add_Experience_summary extends State<Add_Experience_summary> {


  final TextEditingController experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Experience Summary"),
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

                // Experience Summary
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2000),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Experience Summary can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Experience Summary";
                    }
                  },
                  onChanged: (text) => setState(() {
                    experienceController.text = text;
                  }
                  ),
                  controller: experienceController,
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
