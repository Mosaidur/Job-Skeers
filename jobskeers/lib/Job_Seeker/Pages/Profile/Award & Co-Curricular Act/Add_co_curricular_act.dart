import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add_co_curricular_act extends StatefulWidget {
  const Add_co_curricular_act({super.key});

  @override
  State<Add_co_curricular_act> createState() => _Add_co_curricular_actState();
}

class _Add_co_curricular_actState extends State<Add_co_curricular_act> {

  final TextEditingController activitiesController = TextEditingController();
  final TextEditingController workExperienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Co Curricular Activities"),
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

                // Co Curricular Activity
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Co Curricular Activity can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Co Curricular Activity";
                    }
                  },
                  onChanged: (text) => setState(() {
                    activitiesController.text = text;
                  }
                  ),
                  controller: activitiesController,
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

                //WorkExperience in Co Curricular Activity
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2000),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "WorkExperience in Co Curricular Activity can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid WorkExperience in Co Curricular Activity";
                    }
                  },
                  onChanged: (text) => setState(() {
                    workExperienceController.text = text;
                  }
                  ),
                  controller: workExperienceController,
                  maxLines: 12,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "WorkExperience in Co Curricular Activity*",
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
