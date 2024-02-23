import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Job_Seeker/Pages/Profile/Trainning%20and%20Skills/skills.dart';

import '../../../customDialogBox.dart';

class Edit_skills extends StatefulWidget {
  const Edit_skills({super.key});

  @override
  State<Edit_skills> createState() => _Edit_skillsState();
}

class _Edit_skillsState extends State<Edit_skills> {

  final TextEditingController skillsTitleController = TextEditingController(text: "");
  final TextEditingController skillsDescriptionController = TextEditingController(text: "");
  final TextEditingController extraCurricularActController = TextEditingController(text: "");
  final TextEditingController learnedFromController = TextEditingController(text: "");

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
              Text("Add Skills"),

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
                            pageLink: SkillsInformation(),
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

                // Skill Title
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Skill Title can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Skill Title";
                    }
                  },
                  onChanged: (text) => setState(() {
                    skillsTitleController.text = text;
                  }
                  ),
                  controller: skillsTitleController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Skill Title*",
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

                //Skills You Learned From
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Learning source can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid learning source";
                    }
                  },
                  onChanged: (text) => setState(() {
                    learnedFromController.text = text;
                  }
                  ),
                  controller: learnedFromController,
                  enabled: true,
                  maxLines: 2,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: "Skills You Learned From*",
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

                //Skill Description
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Skill Description can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Skill Description";
                    }
                  },
                  onChanged: (text) => setState(() {
                    skillsDescriptionController.text = text;
                  }
                  ),
                  controller: skillsDescriptionController,
                  enabled: true,
                  maxLines: 4,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: "Skill Description*",
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

                // Extra Curricular Activities (Skills Related)
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Extra Curricular Activities can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Extra Curricular Activities";
                    }
                  },
                  onChanged: (text) => setState(() {
                    extraCurricularActController.text = text;
                  }
                  ),
                  controller: extraCurricularActController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Extra Curricular Activities (Skills Related)*",
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
                  child: Text("Updte"),
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
