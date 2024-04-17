import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Job_Seeker/Pages/Profile/Education/professional_certification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../CustomSnackbar.dart';
import '../../../Models/register_data_To.dart';
import '../../../customDialogBox.dart';
import '../../../loading_page.dart';

class Add_Edit_professional_certification extends StatefulWidget {
  final String? Certification_Id;
  final String? certificationTitle;
  final String? instituteName;
  final String? location;
  final String? startDate;
  final String? endDate;

  const Add_Edit_professional_certification({super.key,
    this.Certification_Id, this.certificationTitle,
    this.instituteName, this.location, this.startDate, this.endDate});

  @override
  State<Add_Edit_professional_certification> createState() => _Add_Edit_professional_certificationState();
}

class _Add_Edit_professional_certificationState extends State<Add_Edit_professional_certification> {

  DateTime selectedDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1952),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        startDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1952),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        endDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  late TextEditingController certificationTitleController;
  late TextEditingController instituteNameController ;
  late TextEditingController locationController ;
  late TextEditingController startDateController ;
  late TextEditingController endDateController ;

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
    if (widget.Certification_Id == null) {
      certificationTitleController = TextEditingController();
      instituteNameController = TextEditingController();
      locationController = TextEditingController();
      startDateController = TextEditingController();
      endDateController = TextEditingController();
    } else {
      certificationTitleController = TextEditingController(text: widget.certificationTitle);
      instituteNameController = TextEditingController(text: widget.instituteName);
      locationController = TextEditingController(text: widget.location);
      startDateController = TextEditingController(text: widget.startDate);
      endDateController = TextEditingController(text: widget.endDate);
    }
  }

  bool _validateForm() {
    if (
    certificationTitleController.text.isEmpty ||
        instituteNameController.text.isEmpty ||
        locationController.text.isEmpty ||
        startDateController.text.isEmpty || endDateController.text.isEmpty
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


  void _insertCertificationInfo() {
    if (_validateForm()){
      insertCertificationInfo();
    }
  }

  void _updateCertificationInfo() {
    if (_validateForm()){
      updateCertificationInfo();
    }
  }

  Future<void> insertCertificationInfo() async {
    LoadingPage();
    const apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Certifications%20Info/Insert_certifications_info.php';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'certificationTitle': certificationTitleController.text,
          'instituteName': instituteNameController.text,
          'location': locationController.text,
          'startDate': startDateController.text,
          'endDate': endDateController.text,
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

  Future<void> updateCertificationInfo () async {
    LoadingPage();

    const String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Certifications%20Info/Update_certifications_info.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'certification_id': widget.Certification_Id,
          'certificationTitle': certificationTitleController.text,
          'instituteName': instituteNameController.text,
          'location': locationController.text,
          'startDate': startDateController.text,
          'endDate': endDateController.text,
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

  Future<void> deleteCertificationInfo() async {
    LoadingPage();

    const String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Certifications%20Info/Delete_certifications_info.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'Certification_Id': widget.Certification_Id,
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
              (widget.Certification_Id == null)?
              Text("Add Language Proficiency"):
              Text("Edit Language Proficiency"),

              (widget.Certification_Id == null)? Container(): InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> Add_language_prof ()));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          CustomDialogBox(
                            message: 'Are you sure you want to delete?',
                            bgcolors: Colors.white,
                            title: 'Delete',
                            pageLink: Professional_Certification(),
                            workedfunction: deleteCertificationInfo,
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

                // Certification Title
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Certification Title can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Certification Title";
                    }
                  },
                  onChanged: (text) => setState(() {
                    certificationTitleController.text = text;
                  }
                  ),
                  controller: certificationTitleController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Certification Title*",
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

                // Institute Name
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
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
                    instituteNameController.text = text;
                  }
                  ),
                  controller: instituteNameController,
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

                // Location
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Location Name can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid location";
                    }
                  },
                  onChanged: (text) => setState(() {
                    locationController.text = text;
                  }
                  ),
                  controller: locationController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Location*",
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

                // Start Date
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Start Date can't be empty";
                    }
                    if (text.length==9){
                      return "Please enter a valid Start date";
                    }
                  },
                  onChanged: (text) => setState(() {
                    startDateController.text = text;
                  }
                  ),
                  controller: startDateController,
                  readOnly: true,
                  enabled: true,
                  onTap: ()=> _selectStartDate(context),
                  decoration: InputDecoration(
                    hintText: "Start Date*",
                    suffixIcon: IconButton(
                      onPressed: () => _selectStartDate(context),
                      icon: Icon(Icons.calendar_today),
                    ),
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

                // End Date
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "End Date can't be empty";
                    }
                    if (text.length==9){
                      return "Please enter a valid End date";
                    }
                  },
                  onChanged: (text) => setState(() {
                    endDateController.text = text;
                  }
                  ),
                  controller: endDateController,
                  readOnly: true,
                  enabled: true,
                  onTap: ()=> _selectEndDate(context),
                  decoration: InputDecoration(
                    hintText: "End Date*",
                    suffixIcon: IconButton(
                      onPressed: () => _selectEndDate(context),
                      icon: Icon(Icons.calendar_today),
                    ),
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
                    if (widget.Certification_Id == null){
                      if(_validateForm() == true) {
                        Navigator.pop(context);
                        _insertCertificationInfo();
                      }
                    }else {
                      if(_validateForm() == true) {
                        Navigator.pop(context);
                        _updateCertificationInfo();
                      }
                    }
                  },
                  child: (widget.Certification_Id == null)? Text("Submit") : Text("Update"),
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
