import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Job_Seeker/Pages/Profile/Education/academic_qualification.dart';

import '../../../customDialogBox.dart';

class Edit_academic_qualification extends StatefulWidget {
  final String? acQualificationid;
  Edit_academic_qualification({super.key, this.acQualificationid});

  @override
  State<Edit_academic_qualification> createState() => _Edit_academic_qualificationState();
}

class _Edit_academic_qualificationState extends State<Edit_academic_qualification> {


  final TextEditingController levelOfEduController = TextEditingController(text: "");
  final TextEditingController degreeTitleController = TextEditingController(text: "PSC/ 5 pass");
  final TextEditingController boardController = TextEditingController(text: "");
  final TextEditingController majorOrgroupController = TextEditingController(text: "");
  final TextEditingController institutionNameController = TextEditingController(text: "");
  final TextEditingController resultController = TextEditingController(text: "");
  final TextEditingController gpaController = TextEditingController(text: "");
  final TextEditingController passingYearController = TextEditingController(text: "");
  final TextEditingController durationController = TextEditingController(text: "");

  String? _selectedLevelOfEdu ;
  String? _selectedBoard;
  String? _selectedResult;


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
                Text("Edit Academic Qualification"),
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
                              pageLink: AcademicQualification(),

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

                  SizedBox(height: 15,),
                  //level of Education
                  DropdownButtonFormField<String>(
                    value: _selectedLevelOfEdu != null ? levelOfEduController.text : null,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Level of Education*",
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
                      'PSC/ 5 pass',
                      'JSC/JDC/8 pass',
                      'Secondary',
                      'Higher Secondary',
                      'Diploma',
                      'Bachelor/Honors',
                      'Masters',
                      'Doctoral',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLevelOfEdu = newValue!;
                        levelOfEduController.text = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 20,),

                  //Degree title
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(200),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text){
                      if (text == null || text.isEmpty){
                        return "Degree title can't be empty";
                      }
                      if (text.length<3){
                        return "Please enter a valid Degree title";
                      }
                    },
                    onChanged: (text) => setState(() {
                      degreeTitleController.text = text;
                    }
                    ),
                    controller: degreeTitleController,
                    maxLines: 3,
                    minLines: 1,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: "Degree title*",
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

                  //Board
                  (levelOfEduController.text ==  'PSC/ 5 pass'||
                      levelOfEduController.text ==  'JSC/JDC/8 pass' ||
                      levelOfEduController.text ==  'Secondary'||
                      levelOfEduController.text ==  'Higher Secondary'
                  )?
                  DropdownButtonFormField<String>(
                    value: _selectedBoard != null ? boardController.text : null,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Education Board*",
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
                      'Barisal',
                      'Chittagong',
                      'Comilla',
                      'Dhaka',
                      'Dinajpur',
                      'Jessore',
                      'Rajshahi',
                      'Sylhet',
                      'Mymensingh',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedBoard = newValue!;
                        boardController.text = newValue;
                      });
                    },
                  ) : Container(),
                  (levelOfEduController.text ==  'PSC/ 5 pass'||
                      levelOfEduController.text ==  'JSC/JDC/8 pass' ||
                      levelOfEduController.text ==  'Secondary'||
                      levelOfEduController.text ==  'Higher Secondary'
                  )?SizedBox(height: 20,) : SizedBox(),

                  //Major or Group
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text){
                      if (text == null || text.isEmpty){
                        return "Major or Group can't be empty";
                      }
                      if (text.length<3){
                        return "Please enter a valid Major or Group";
                      }
                    },
                    onChanged: (text) => setState(() {
                      majorOrgroupController.text = text;
                    }
                    ),
                    controller: majorOrgroupController,
                    maxLines: 3,
                    minLines: 1,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: "Major or Group*",
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

                  //Institute Name
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text){
                      if (text == null || text.isEmpty){
                        return "Institute Name can't be empty";
                      }
                      if (text.length<3){
                        return "Please enter a valid Institute Name";
                      }
                    },
                    onChanged: (text) => setState(() {
                      institutionNameController.text = text;
                    }
                    ),
                    controller: institutionNameController,
                    maxLines: 3,
                    minLines: 1,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: "Institute Name*",
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

                  //result
                  DropdownButtonFormField<String>(
                    value: _selectedResult != null ? resultController.text : null,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Result*",
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
                      'Grade',
                      'Enrolled/Running',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedResult = newValue!;
                        resultController.text = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 20,),

                  //GPA
                  (resultController.text =='Grade')?
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text){
                      if (text == null || text.isEmpty){
                        return "Grade can't be empty";
                      }
                      if (text.length<3){
                        return "Please enter a valid Grade";
                      }
                    },
                    onChanged: (text) => setState(() {
                      gpaController.text = text;
                    }
                    ),
                    controller: gpaController,
                    keyboardType: TextInputType.number,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: "GPA*",
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
                  )
                      : Container(),
                  (resultController.text =='Grade')? SizedBox(height: 20,) : SizedBox(),

                  // Passing year
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text){
                      if (text == null || text.isEmpty){
                        return "Passing year can't be empty";
                      }
                      if (text.length<3){
                        return "Please enter a valid Passing year";
                      }
                    },
                    onChanged: (text) => setState(() {
                      passingYearController.text = text;
                    }
                    ),
                    controller: passingYearController,
                    keyboardType: TextInputType.text,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: "Passing year*",
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

                  //Duration
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text){
                      if (text == null || text.isEmpty){
                        return "Duration can't be empty";
                      }
                      if (text.length<10){
                        return "Please enter a valid Duration";
                      }
                    },
                    onChanged: (text) => setState(() {
                      durationController.text = text;
                    }
                    ),
                    controller: durationController,
                    keyboardType: TextInputType.text,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: "Duration",
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
                    child: Text("Update"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff03438C), // Change this color to your desired color
                    ),
                  ),

                  SizedBox(height: 50),


                ],
              ),
            ),
          ),
        )
    );
  }
}
