import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Job_Seeker/customDialogBox.dart';

import 'language_prof.dart';

class Edit_language_prof extends StatefulWidget {
  const Edit_language_prof({super.key});

  @override
  State<Edit_language_prof> createState() => _Edit_language_profState();
}

class _Edit_language_profState extends State<Edit_language_prof> {

  final TextEditingController languageController = TextEditingController(text: "");
  final TextEditingController readingLevelController = TextEditingController(text: "");
  final TextEditingController writingLevelController = TextEditingController(text: "");
  final TextEditingController speakingLevelController = TextEditingController(text: "");

  String? _selectedreadingLevel;
  String? _selectedwritingLevel;
  String? _selectedspeakingLevel;

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
              Text("Edit Language Proficiency"),

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
                          pageLink: LanguageProficiency(),
                        )
                  );
                },
                child: Icon(Icons.delete),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                SizedBox(height: 20,),
                //Language title
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Language title can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Language title";
                    }
                  },
                  onChanged: (text) => setState(() {
                    languageController.text = text;
                  }
                  ),
                  controller: languageController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Language*",
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

                // reading level
                DropdownButtonFormField<String>(
                  value: _selectedreadingLevel != null ? readingLevelController.text : null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Reading Level*",
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
                  items: <String>[
                    'Low',
                    'Medium',
                    'High',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedreadingLevel = newValue!;
                      readingLevelController.text = newValue;
                    });
                  },
                ),
                SizedBox(height: 20,),

                // writing Level
                DropdownButtonFormField<String>(
                  value: _selectedwritingLevel != null ? writingLevelController.text : null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Writing Level*",
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
                  items: <String>[
                    'Low',
                    'Medium',
                    'High',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedwritingLevel = newValue!;
                      writingLevelController.text = newValue;
                    });
                  },
                ),
                SizedBox(height: 20,),

                // speaking level
                DropdownButtonFormField<String>(
                  value: _selectedspeakingLevel != null ? speakingLevelController.text : null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Speaking Level*",
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
                  items: <String>[
                    'Low',
                    'Medium',
                    'High',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedspeakingLevel = newValue!;
                      speakingLevelController.text = newValue;
                    });
                  },
                ),
                SizedBox(height: 20,),

                ElevatedButton(
                  onPressed: (){

                  },
                  child: Text("Update"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff03438C), // Change this color to your desired color
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
