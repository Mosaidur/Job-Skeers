import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Job_Seeker/Pages/Profile/Education/academic_qualification.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../CustomSnackbar.dart';
import '../../../Models/register_data_To.dart';
import '../../../customDialogBox.dart';
import '../../../loading_page.dart';

class Edit_academic_qualification extends StatefulWidget {
  final String? acQualificationid;
  final String? levelOfEdu;
  final String? degreeTitle;
  final String? board;
  final String? group;
  final String? institutionName;
  final String? result;
  final String? gpa;
  final String? passingYear;
  final String? duration;
  Edit_academic_qualification(
      {super.key,
    this.acQualificationid,
    this.levelOfEdu,
    this.degreeTitle,
    this.board,
    this.group,
    this.institutionName,
    this.result,
    this.gpa,
    this.passingYear,
    this.duration});

  @override
  State<Edit_academic_qualification> createState() => _Edit_academic_qualificationState();
}

class _Edit_academic_qualificationState extends State<Edit_academic_qualification> {

  late  TextEditingController levelOfEduController;
  late  TextEditingController degreeTitleController;
  late  TextEditingController boardController;
  late  TextEditingController majorOrgroupController;
  late  TextEditingController institutionNameController;
  late  TextEditingController resultController;
  late  TextEditingController gpaController;
  late  TextEditingController passingYearController;
  late  TextEditingController durationController;

  String? _selectedLevelOfEdu ;
  String? _selectedBoard;
  String? _selectedResult;

  late SharedPreferences sprefs;
  String? UserID;

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      UserID = sprefs.getString("USERID");
      // Pre_Update_value();
    });
  }



  void Pre_Update_value() {
    if (widget.acQualificationid == null) {
       levelOfEduController = TextEditingController();
      degreeTitleController = TextEditingController();
      boardController = TextEditingController();
      majorOrgroupController = TextEditingController();
      institutionNameController = TextEditingController();
      resultController = TextEditingController();
      gpaController = TextEditingController();
      passingYearController = TextEditingController();
      durationController = TextEditingController();
    }else{
      levelOfEduController = TextEditingController(text: widget.levelOfEdu);
      degreeTitleController = TextEditingController(text: widget.degreeTitle);
      boardController = TextEditingController(text: widget.board);
      majorOrgroupController = TextEditingController(text: widget.group);
      institutionNameController = TextEditingController(text: widget.institutionName);
      resultController = TextEditingController(text: widget.result);
      gpaController = TextEditingController(text: widget.gpa);
      passingYearController = TextEditingController(text: widget.passingYear);
      durationController = TextEditingController(text: widget.duration);



      // levelOfEduController = TextEditingController();
      // degreeTitleController = TextEditingController();
      // boardController = TextEditingController();
      // majorOrgroupController = TextEditingController();
      // institutionNameController = TextEditingController();
      // resultController = TextEditingController();
      // gpaController = TextEditingController();
      // passingYearController = TextEditingController();
      // durationController = TextEditingController();

    }
  }

  bool _validateForm() {

    if(
    (boardController.text== 'PSC/ 5 pass'||
        boardController.text== 'JSC/JDC/8 pass'||
        boardController.text== 'Secondary' ||
        boardController.text==   'Higher Secondary') && (resultController.text == 'Grade')
    // (boardController.text != 'PSC/ 5 pass' &&
    //     boardController.text != 'JSC/JDC/8 pass' &&
    //     boardController.text != 'Secondary' &&
    //     boardController.text != 'Higher Secondary') &&
    //     (resultController.text != 'Grade')
    ){
      if (levelOfEduController.text.isEmpty ||
          degreeTitleController.text.isEmpty ||
          majorOrgroupController.text.isEmpty ||
          institutionNameController.text.isEmpty ||
          resultController.text.isEmpty ||
          passingYearController.text.isEmpty ||
          boardController.text.isEmpty ||
          gpaController.text.isEmpty ||
          durationController.text.isEmpty ) {

        Future.delayed(Duration.zero, () {
          CustomSnackBar.show(
            context,
            message: 'Please fill all fields.',
            backgroundColor: Colors.red.shade400, // Set your desired background color
            actionLabel: 'Error!',
            iconData: Icons.error,
            onActionPressed: () {
              // Handle action press
              Navigator.of(context).pop; // or any other action
            },
          );
        });
        // return false;
      }
      return false;
    }else if(
    levelOfEduController.text.isEmpty ||
        degreeTitleController.text.isEmpty ||
        // boardController.text.isEmpty ||
        majorOrgroupController.text.isEmpty ||
        institutionNameController.text.isEmpty ||
        resultController.text.isEmpty ||
        // gpaController.text.isEmpty ||
        passingYearController.text.isEmpty ||
        durationController.text.isEmpty
    ) {
      Future.delayed(Duration.zero, () {
        CustomSnackBar.show(
          context,
          message: 'Please fill all fields.',
          backgroundColor: Colors.red.shade400, // Set your desired background color
          actionLabel: 'Error!',
          iconData: Icons.error,
          onActionPressed: () {
            // Handle action press
            Navigator.of(context).pop; // or any other action
          },
        );
      });
      return false;
    }else{
      return true;
    }

  }




  void _insertEducationInfo() {
    if (_validateForm()){
      insertEducationInfo();
    }
  }

  void _updateEducationInfo() {
    if (_validateForm()){
      updateEducationInfo();
    }
  }

  Future<void> insertEducationInfo() async {
    LoadingPage();
    const apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Education%20History/Insert_education_history.php';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'levelOfEdu': levelOfEduController.text,
          'degreeTitle': degreeTitleController.text,
          'board': (['PSC/ 5 pass', 'JSC/JDC/8 pass', 'Secondary', 'Higher Secondary'].contains(levelOfEduController.text)) ? boardController.text : " ",
          // 'board': (() {
          //   if (['PSC/ 5 pass', 'JSC/JDC/8 pass', 'Secondary', 'Higher Secondary'].contains(levelOfEduController.text)) {
          //     return boardController.text;
          //   } else {
          //     return "";
          //   }
          // })(),
          // 'gpa': (() {
          //   if (resultController.text == 'Grade') {
          //     return gpaController.text;
          //   } else {
          //     return "";
          //   }
          // })(),
          'groupandMajor': majorOrgroupController.text,
          'institutionName': institutionNameController.text,
          'result': resultController.text,
          'gpa': (resultController.text == 'Grade') ? gpaController.text : " ",
          'passingYear': passingYearController.text,
          'duration': durationController.text,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['success']) {
          Future.delayed(Duration.zero, () {
            CustomSnackBar.show(
              context,
              message: 'Data inserted successfully.',
              backgroundColor: Colors.green.shade400, // Set your desired background color
              actionLabel: 'Successful.',
              iconData: Icons.done,
              onActionPressed: () {
                // Handle action press
                Navigator.of(context).pop; // or any other action
              },
            );
          });

        } else {
          print('Failed to insert data: ${responseData['message']}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to insert data: ${responseData['message']}')));

          Future.delayed(Duration.zero, () {
            CustomSnackBar.show(
              context,
              message: 'Failed to insert data: ${responseData['message']}.',
              backgroundColor: Colors.red.shade400, // Set your desired background color
              actionLabel: 'Error!',
              iconData: Icons.error,
              onActionPressed: () {
                // Handle action press
                Navigator.of(context).pop; // or any other action
              },
            );
          });

        }
      } else {
        Future.delayed(Duration.zero, () {
          CustomSnackBar.show(
            context,
            message: 'Failed to insert data. Error: ${response.statusCode}.',
            backgroundColor: Colors.red.shade400, // Set your desired background color
            actionLabel: 'Error!',
            iconData: Icons.error,
            onActionPressed: () {
              // Handle action press
              Navigator.of(context).pop; // or any other action
            },
          );
        });

      }
    } catch (error) {
      Future.delayed(Duration.zero, () {
        CustomSnackBar.show(
          context,
          message: 'Error: $error.',
          backgroundColor: Colors.red.shade400, // Set your desired background color
          actionLabel: 'Error!',
          iconData: Icons.error,
          onActionPressed: () {
            // Handle action press
            Navigator.of(context).pop; // or any other action
          },
        );
      });
    }
  }

  Future<void> updateEducationInfo () async {
    LoadingPage();

    const String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Education%20History/Update_education_history.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'Ac_Quali_Id': widget.acQualificationid,
          'levelOfEdu': levelOfEduController.text,
          'degreeTitle': degreeTitleController.text,
          'board': (['PSC/ 5 pass', 'JSC/JDC/8 pass', 'Secondary', 'Higher Secondary']
              .contains(levelOfEduController.text))
              ? boardController.text
              : "",
          'groupandMajor': majorOrgroupController.text,
          'institutionName': institutionNameController.text,
          'result': resultController.text,
          'gpa': (resultController.text == 'Grade') ? gpaController.text : "",
          'passingYear': passingYearController.text,
          'duration': durationController.text,
        },
      );

      if (response.statusCode == 200)  {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final Response = ResponseDataModel.fromJson(responseData);

        if (Response.success == true ) {
          // Show success message
          CustomSnackBar.show(
            context,
            message: '${Response.message}',
            backgroundColor: Colors.green.shade400,
            actionLabel: 'Successful',
            iconData: Icons.done,
            onActionPressed: () {
              Navigator.of(context).pop(); // or any other action
            },
          );


        } else {
          // Show error message
          CustomSnackBar.show(
            context,
            message: 'Update Response: ${Response.message}',
            backgroundColor: Colors.red.shade400,
            actionLabel: 'Error!',
            iconData: Icons.error,
            onActionPressed: () {
              Navigator.of(context).pop(); // or any other action
            },
          );
        }
      } else {
        // Handle other HTTP status codes
        CustomSnackBar.show(
          context,
          message: 'Response Error: ${response.statusCode}. Try again.',
          backgroundColor: Colors.red.shade400,
          actionLabel: 'Error!',
          iconData: Icons.error,
          onActionPressed: () {
            Navigator.of(context).pop(); // or any other action
          },
        );
      }
    } catch (e) {
      // Handle exceptions
      print('Exception occurred: $e');
      CustomSnackBar.show(
        context,
        message: 'Exception occurred: $e',
        backgroundColor: Colors.red.shade400,
        actionLabel: 'Error!',
        iconData: Icons.error,
        onActionPressed: () {
          Navigator.of(context).pop(); // or any other action
        },
      );
    }
  }

  Future<void> deleteEducationInfo() async {
    LoadingPage();

    const String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Education%20History/Delete_education_history.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'Ac_Quali_Id': widget.acQualificationid,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final Response = ResponseDataModel.fromJson(responseData);

        if (Response.success == true) {
          // Show success message
          CustomSnackBar.show(
            context,
            message: '${Response.message}',
            backgroundColor: Colors.green.shade400,
            actionLabel: 'Successful',
            iconData: Icons.done,
            onActionPressed: () {
              Navigator.of(context).pop(); // or any other action
            },
          );
        } else {
          // Show error message
          CustomSnackBar.show(
            context,
            message: 'Delete Response: ${Response.message}',
            backgroundColor: Colors.red.shade400,
            actionLabel: 'Error!',
            iconData: Icons.error,
            onActionPressed: () {
              Navigator.of(context).pop(); // or any other action
            },
          );
        }
      } else {
        // Handle other HTTP status codes
        CustomSnackBar.show(
          context,
          message: 'Response Error: ${response.statusCode}. Try again.',
          backgroundColor: Colors.red.shade400,
          actionLabel: 'Error!',
          iconData: Icons.error,
          onActionPressed: () {
            Navigator.of(context).pop(); // or any other action
          },
        );
      }
    } catch (e) {
      // Handle exceptions
      print('Exception occurred: $e');
      CustomSnackBar.show(
        context,
        message: 'Exception occurred: $e',
        backgroundColor: Colors.red.shade400,
        actionLabel: 'Error!',
        iconData: Icons.error,
        onActionPressed: () {
          Navigator.of(context).pop(); // or any other action
        },
      );
    }
  }


  @override
  void initState() {
    super.initState();
    _loadUserData();
    Pre_Update_value();
  }


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
                    // deleteEducationInfo();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            CustomDialogBox(
                              message: 'Are you sure you want to delete?',
                              bgcolors: Colors.white,
                              title: 'Delete',
                              pageLink: AcademicQualification(),
                              workedfunction: deleteEducationInfo,
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
                      hintText: "GPA/ CGPA *",
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
                      if (text.length<1){
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

                      if (widget.acQualificationid == null){
                        if(_validateForm() == true) {
                          Navigator.pop(context);
                          _insertEducationInfo();
                        }
                      }else {
                        if(_validateForm() == true) {
                          Navigator.pop(context);
                          _updateEducationInfo();
                        }
                      }

                    },
                    child: (widget.acQualificationid == null)? Text("Submit") : Text("Update"),
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
