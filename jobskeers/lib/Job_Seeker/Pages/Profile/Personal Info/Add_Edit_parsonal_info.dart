import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../CustomSnackbar.dart';
import '../../../Models/Profile/Insert_profile_info.dart';
import '../../../Models/register_data_To.dart';
import '../../../loading_page.dart';


class Add_Edit_Personatl_Details extends StatefulWidget {
  final String? pDetailsId;
  final String? father_name;
  final String? mother_name ;
  final String? dateOfBirth;
  final String? religion ;
  final String? gender ;
  final String? marital_status;
  final String? nationality ;
  final String? nid ;
  final String? passport_no ;
  final String? passport_issue_date ;
  final String? blood_group ;

  const Add_Edit_Personatl_Details({
    Key? key,
    this.pDetailsId,
    this.father_name = '',
    this.mother_name = '',
    this.dateOfBirth = '',
    this.religion = '',
    this.gender = '',
    this.marital_status = '',
    this.nationality = '',
    this.nid = '',
    this.passport_no = '',
    this.passport_issue_date = '',
    this.blood_group = '',
  }) : super(key: key);

  @override
  State<Add_Edit_Personatl_Details> createState() => _Add_Edit_Personatl_DetailsState();
}

class _Add_Edit_Personatl_DetailsState extends State<Add_Edit_Personatl_Details> {


  late SharedPreferences sprefs;
  String? UserID;
  String? userName;

  // Create TextEditingController variables for the provided information
  late TextEditingController fatherNameController   ;
  late TextEditingController motherNameController ;
  late TextEditingController dateOfBirthController;
  late TextEditingController religionController ;
  late TextEditingController genderController ;
  late TextEditingController maritalStatusController ;
  late TextEditingController nationalityController ;
  late TextEditingController nidController ;
  late TextEditingController passportNoController ;
  late TextEditingController passportIssueDateController ;
  late TextEditingController  bloodGroupController  ;

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      UserID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
    Pre_Update_value();
  }


  Future<void> updatePersonalInfo () async {
    LoadingPage();

    const String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Parsonal%20Info%20API/Update_personal_info.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'P_Details_Id': widget.pDetailsId.toString(),
          'father_name': fatherNameController.text.toString(),
          'mother_name': motherNameController.text.toString(),
          'date_of_birth': dateOfBirthController.text.toString(),
          'religion': religionController.text.toString(),
          'gender': genderController.text.toString(),
          'marital_status': maritalStatusController.text.toString(),
          'nationality': nationalityController.text.toString(),
          'nid': nidController.text.toString(),
          'passport_no': passportNoController.text.toString(),
          'passport_issue_date': passportIssueDateController.text.toString(),
          'blood_group': bloodGroupController.text.toString(),
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


  Future<void> insertPersonalInfo() async {
    LoadingPage();
    const apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Parsonal%20Info%20API/insert_personal_info.php';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'user_id': UserID,
          'father_name': fatherNameController.text.toString(),
          'mother_name': motherNameController.text.toString(),
          'date_of_birth': dateOfBirthController.text.toString(),
          'religion': religionController.text.toString(),
          'gender': genderController.text.toString(),
          'marital_status': maritalStatusController.text.toString(),
          'nationality': nationalityController.text.toString(),
          'nid': nidController.text.toString(),
          'passport_no': passportNoController.text.toString(),
          'passport_issue_date': passportIssueDateController.text.toString(),
          'blood_group': bloodGroupController.text.toString(),
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

  void _insertPersonalInfo() {
    if (_validateForm()){
      insertPersonalInfo();
    }
  }

  void _updatePersonalInfo() {
    if (_validateForm()){
      updatePersonalInfo();
    }
  }

  bool _validateForm() {
    if (fatherNameController.text.isEmpty ||
        motherNameController.text.isEmpty ||
        dateOfBirthController.text.isEmpty ||
        religionController.text.isEmpty ||
        genderController.text.isEmpty ||
        maritalStatusController.text.isEmpty ||
        nationalityController.text.isEmpty ||
        nidController.text.isEmpty ||
        passportNoController.text.isEmpty ||
        passportIssueDateController.text.isEmpty ||
        bloodGroupController.text.isEmpty) {

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

  void Pre_Update_value() {
    if (widget.pDetailsId != null) {
      fatherNameController = TextEditingController(text: widget.father_name);
      motherNameController = TextEditingController(text: widget.mother_name);
      dateOfBirthController = TextEditingController(text: widget.dateOfBirth);
      religionController = TextEditingController(text: widget.religion);
      genderController = TextEditingController(text: widget.gender);
      maritalStatusController = TextEditingController(text: widget.marital_status);
      nationalityController = TextEditingController(text: widget.nationality);
      nidController = TextEditingController(text: widget.nid);
      passportNoController = TextEditingController(text: widget.passport_no);
      passportIssueDateController = TextEditingController(text: widget.passport_issue_date);
      bloodGroupController = TextEditingController(text: widget.blood_group);
    }else{
      fatherNameController = TextEditingController();
      motherNameController = TextEditingController();
      dateOfBirthController = TextEditingController();
      religionController = TextEditingController();
      genderController = TextEditingController();
      maritalStatusController = TextEditingController();
      nationalityController = TextEditingController();
      nidController = TextEditingController();
      passportNoController = TextEditingController();
      passportIssueDateController = TextEditingController();
      bloodGroupController = TextEditingController();
    }
  }

  String? _selectedReligion  ;
  String? _selectedGender;
  String? _selectedmaritalStatus;
  String? _selectebloodGroup;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1952),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateOfBirthController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectpassportIssueDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1952),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        passportIssueDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              (widget.pDetailsId == null)?
              Text("Add Personal Details") :
              Text("Edit Personal Details"),

              // InkWell(
              //   onTap: (){},
              //   child: Icon(Icons.edit_note_sharp),
              // )
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
                // Father's Name form field
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Father's Name can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Father's Name";
                    }
                    if (text.length >99){
                      return"Father's Name can't be more than 100";
                    }
                  },
                  onChanged: (text) => setState(() {
                    fatherNameController.text = text;
                  }
                  ),
                  controller: fatherNameController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Father's Name*",
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
                SizedBox(height: 20),

                // Mother's Name form field
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Mother's name can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Mother's name";
                    }
                    if (text.length >99){
                      return"Mother's name can't be more than 100";
                    }
                  },
                  onChanged: (text) => setState(() {
                    motherNameController.text = text;
                  }
                  ),
                  controller: motherNameController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Mother's Name*",
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
                SizedBox(height: 20),

                // Date of Birth form field
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Date can't be empty";
                    }
                    if (text.length==9){
                      return "Please enter a valid date";
                    }
                  },
                  onChanged: (text) => setState(() {
                    dateOfBirthController.text = text;
                  }
                  ),
                  controller: dateOfBirthController,
                  readOnly: true,
                  enabled: true,
                  onTap: ()=> _selectDate(context),
                  decoration: InputDecoration(
                    labelText: "Date of Birth*",
                    suffixIcon: IconButton(
                      onPressed: () => _selectDate(context),
                      icon: Icon(Icons.calendar_today),
                    ),
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
                SizedBox(height: 20),

                // Religion form field
                DropdownButtonFormField<String>(
                  value: (widget.pDetailsId != null) ? widget.religion : null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Religion*",
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
                    'Hinduism',
                    'Islam',
                    'Christianity',
                    'Sikhism',
                    'Buddhism',
                    'Others',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedReligion = newValue!;
                      religionController.text = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),

                // Gender form field
                DropdownButtonFormField<String>(
                  value: (widget.pDetailsId != null) ? widget.gender : null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Gender*",
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
                    'Male',
                    'Female',
                    'Others',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue!;
                      genderController.text = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),

                // Marital Status form field
                DropdownButtonFormField<String>(
                  value: (widget.pDetailsId != null) ? widget.marital_status :  null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Marital Status*",
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
                  items: <String>['Married', 'Unmarried']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedmaritalStatus = newValue!;
                      maritalStatusController.text = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),

                // Nationality form field
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Nationality can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Nationality";
                    }
                    if (text.length>99){
                      return "Please enter a valid Nationality";
                    }
                  },
                  onChanged: (text) => setState(() {
                    nationalityController.text = text;
                  }
                  ),
                  controller: nationalityController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Nationality*",
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
                SizedBox(height: 20),

                // NID form field
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "National ID No can't be empty";
                    }
                    if (text.length<9){
                      return "Please enter a valid National ID No";
                    }
                    if (text.length>50){
                      return "Please enter a valid National ID No";
                    }
                  },
                  onChanged: (text) => setState(() {
                    nidController.text = text;
                  }
                  ),
                  controller: nidController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "National ID No",
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
                SizedBox(height: 20),

                // Passport No form field
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Passport No can't be empty";
                    }
                    if (text.length<9){
                      return "Please enter a valid Passport No";
                    }
                    if (text.length>99){
                      return "Please enter a valid Passport No";
                    }
                  },
                  onChanged: (text) => setState(() {
                    passportNoController.text = text;
                  }
                  ),
                  controller: passportNoController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Passport No",
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
                SizedBox(height: 20),

                // Passport Issue Date form field
                TextFormField(
                  onTap: () => _selectpassportIssueDate(context),
                  controller: passportIssueDateController,
                  readOnly: true,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Passport Issue Date",
                    suffixIcon: IconButton(
                      onPressed: () => _selectpassportIssueDate(context),
                      icon: Icon(Icons.calendar_today),
                    ),
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
                SizedBox(height: 20),

                // Blood Group form field
                DropdownButtonFormField<String>(
                  value: (widget.pDetailsId != null) ? widget.blood_group : null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Blood Group",
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
                    'A+', 'A-','B+', 'B-','O+', 'O-','AB+', 'AB-',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectebloodGroup = newValue!;
                      bloodGroupController.text = newValue;
                    });
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: (){
                    if (widget.pDetailsId == null){
                      if(_validateForm() == true) {
                        Navigator.pop(context);
                        _insertPersonalInfo();
                      }
                    }else {
                      if(_validateForm() == true) {
                        Navigator.pop(context);
                        _updatePersonalInfo();
                      }
                    }
                  },
                  child: (widget.pDetailsId == null)? Text("Submit") : Text("Update"),
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
