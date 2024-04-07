import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Job_Seeker/customDialogBox.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../CustomSnackbar.dart';
import '../../../Models/register_data_To.dart';
import '../../../loading_page.dart';
import 'language_prof.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Add_Edit_language_prof extends StatefulWidget {
  final String? languageId;
  final String? language;
  final String? readingLevel;
  final String? writingLevel;
  final String? speakingLevel;
  const Add_Edit_language_prof({
    super.key,
    this.languageId,
    this.language,
    this.readingLevel,
    this.writingLevel,
    this.speakingLevel});

  @override
  State<Add_Edit_language_prof> createState() => _Add_Edit_language_profState();
}

class _Add_Edit_language_profState extends State<Add_Edit_language_prof> {

  String? _selectedreadingLevel;
  String? _selectedwritingLevel;
  String? _selectedspeakingLevel;

  late TextEditingController languageController;
  late TextEditingController readingLevelController;
  late TextEditingController writingLevelController;
  late TextEditingController speakingLevelController;

  late SharedPreferences sprefs;
  String? UserID;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    Pre_Update_value();
  }

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      UserID = sprefs.getString("USERID");
      // Pre_Update_value();
    });
  }

  void Pre_Update_value() {
    if (widget.languageId == null) {
      languageController = TextEditingController();
      readingLevelController = TextEditingController();
      writingLevelController = TextEditingController();
      speakingLevelController = TextEditingController();
    } else {
      languageController = TextEditingController(text: widget.language);
      readingLevelController = TextEditingController(text: widget.readingLevel);
      writingLevelController = TextEditingController(text: widget.writingLevel);
      speakingLevelController = TextEditingController(text: widget.speakingLevel);
    }
  }

  bool _validateForm() {
    if (
        languageController.text.isEmpty ||
        readingLevelController.text.isEmpty ||
        writingLevelController.text.isEmpty ||
        speakingLevelController.text.isEmpty
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
            Navigator.of(context).pop(); // or any other action
          },
        );
      });
      return false;
    } else {
      return true;
    }
  }


  void _insertEducationInfo() {
    if (_validateForm()){
      insertLanguageSkillsInfo();
    }
  }

  void _updateEducationInfo() {
    if (_validateForm()){
      updateLanguageSkillsInfo();
    }
  }


  Future<void> insertLanguageSkillsInfo() async {
    LoadingPage();
    const apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Language%20Info/Insert_language_info.php';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'language': languageController.text,
          'readingLevel': readingLevelController.text,
          'writingLevel': writingLevelController.text,
          'speakingLevel': speakingLevelController.text,
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
                Navigator.of(context).pop(); // or any other action
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
                Navigator.of(context).pop(); // or any other action
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
              Navigator.of(context).pop(); // or any other action
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
            Navigator.of(context).pop(); // or any other action
          },
        );
      });
    }
  }

  Future<void> updateLanguageSkillsInfo () async {
    LoadingPage();

    const String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Language%20Info/Update_language_info.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'language_id': widget.languageId,
          'language': languageController.text,
          'reading_level': readingLevelController.text,
          'writing_level': writingLevelController.text,
          'speaking_level': speakingLevelController.text,
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

  Future<void> deleteLanguageSkill() async {
    LoadingPage();

    const String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Language%20Info/Delete_language_info.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'Language_Id': widget.languageId,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final ResponseDataModel responseModel = ResponseDataModel.fromJson(responseData);

        if (responseModel.success == true) {
          // Show success message
          CustomSnackBar.show(
            context,
            message: '${responseModel.message}',
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
            message: 'Delete Response: ${responseModel.message}',
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
              (widget.languageId == null)?
              Text("Add Language Proficiency"):
              Text("Edit Language Proficiency"),

              (widget.languageId == null)? Container():
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
                          workedfunction: deleteLanguageSkill,
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
                    labelText: "Language*",
                    labelStyle: TextStyle(
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
                    labelText: "Reading Level*",
                    labelStyle: TextStyle(
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
                    labelText: "Writing Level*",
                    labelStyle: TextStyle(
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
                    labelText: "Speaking Level*",
                    labelStyle: TextStyle(
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

                    if (widget.languageId == null){
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
      ),
    );
  }
}
