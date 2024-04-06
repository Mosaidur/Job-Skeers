import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Job_Seeker/Pages/Profile/Account%20Settings/account_settings.dart';
import 'package:jobskeers/Job_Seeker/customDialogBox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../CustomSnackbar.dart';
import '../../../Models/register_data_To.dart';
import '../../../loading_page.dart';

class Add_Edit_Contact_Details extends StatefulWidget {
  final String? CDetailsId;
  final String? presentAddress;
  final String? permanentAddress;
  final String? secondaryPhoneNo;
  final String? emergencyPhoneNo;
  final String? secondaryEmail;

  final String? primaryEmail;
  final String? primaryPhoneNo;

  Add_Edit_Contact_Details({super.key,
    this.CDetailsId,
    this.presentAddress,
    this.permanentAddress,
    this.secondaryPhoneNo,
    this.emergencyPhoneNo,
    this.secondaryEmail,

    this.primaryEmail,
    this.primaryPhoneNo
  });

  @override
  State<Add_Edit_Contact_Details> createState() => _Add_Edit_Contact_DetailsState();
}

class _Add_Edit_Contact_DetailsState extends State<Add_Edit_Contact_Details> {

  late SharedPreferences sprefs;
  String? UserID;
  String? userName;
  String? userEmail;
  String? userPhone;

  Future<void> _loadUserData() async {
    sprefs = await SharedPreferences.getInstance();
    setState(() {
      UserID = sprefs.getString("USERID");
      userName = sprefs.getString("USERNAME");
      userEmail = sprefs.getString("USEREMAIL");
      userPhone = sprefs.getString("USERPHONENO");
      // Pre_Update_value( userPhone!,userEmail!);
    });
    // Pre_Update_value( userPhone!,userEmail!);
  }


  // Creating text editing controllers for the provided information
  late final TextEditingController presentAddressController ;
  late final TextEditingController permanentAddressController ;
  late final TextEditingController secondaryPhoneNoController ;
  late final TextEditingController emergencyPhoneNoController;
  late final TextEditingController secondaryEmailController ;

  late final TextEditingController primaryPhoneNoController  ;
  late final TextEditingController primaryEmailController ;

  void Pre_Update_value( String userPhone, String userEmail) {

      primaryPhoneNoController = TextEditingController(text: userPhone );
      primaryEmailController = TextEditingController(text: userEmail);
  }

  void Update_value() {
    if (widget.CDetailsId != null) {
      presentAddressController = TextEditingController(text: widget.presentAddress );
      permanentAddressController = TextEditingController(text: widget.permanentAddress );
      secondaryPhoneNoController = TextEditingController(text: widget.secondaryPhoneNo );
      emergencyPhoneNoController = TextEditingController(text: widget.emergencyPhoneNo );
      secondaryEmailController = TextEditingController(text: widget.secondaryEmail );
      primaryEmailController = TextEditingController(text: widget.primaryEmail);
      primaryPhoneNoController = TextEditingController(text: widget.primaryPhoneNo );
    }else{
      presentAddressController = TextEditingController();
      permanentAddressController = TextEditingController();
      secondaryPhoneNoController = TextEditingController();
      emergencyPhoneNoController = TextEditingController();
      secondaryEmailController = TextEditingController();
      primaryPhoneNoController = TextEditingController(text: widget.primaryPhoneNo );
      primaryEmailController = TextEditingController(text: widget.primaryEmail);
    }
  }

  bool _validateForm() {
    if (presentAddressController.text.isEmpty ||
        permanentAddressController.text.isEmpty ||
        secondaryPhoneNoController.text.isEmpty ||
        emergencyPhoneNoController.text.isEmpty ||
        secondaryEmailController.text.isEmpty ) {

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

  void _insertContactInfo() {
    if (_validateForm()){
      insertContactInfo();
    }
  }

  void _updateContactInfo() {
    if (_validateForm()){
      updateContactInfo();
    }
  }

  Future<void> insertContactInfo() async {
    LoadingPage();
    const apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Contact%20Info%20API/Insert_Contact_info.php';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'userId': UserID,
          'presentAddress': presentAddressController.text,
          'permanentAddress': permanentAddressController.text,
          'secondaryPhoneNo': secondaryPhoneNoController.text,
          'emergencyPhoneNo': emergencyPhoneNoController.text,
          'secondaryEmail': secondaryEmailController.text,

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

  Future<void> updateContactInfo () async {
    LoadingPage();

    const String apiUrl = 'http://10.0.2.2/JobSeeker_EmpAPI/Contact%20Info%20API/Update_Contact_info.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'userId': UserID,
          'contactId': widget.CDetailsId,
          'presentAddress': presentAddressController.text,
          'permanentAddress': permanentAddressController.text,
          'secondaryPhoneNo': secondaryPhoneNoController.text,
          'emergencyPhoneNo': emergencyPhoneNoController.text,
          'secondaryEmail': secondaryEmailController.text,
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

          // _contactInfoStreamController.sink.add(ContactInfoDTO);
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

  @override
  void initState() {
    super.initState();
    _loadUserData();
    Update_value();
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
          title: Text("Edit Contact Details"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Widget for Present Address
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Present Address can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Present Address";
                    }
                  },
                  onChanged: (text) => setState(() {
                    presentAddressController.text = text;
                  }
                  ),
                  controller: presentAddressController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Present Address",
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
                // Widget for Permanent Address
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Permanent Address can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Permanent Address";
                    }
                    if (text.length>99){
                      return "Please enter a valid Permanent Address";
                    }
                  },
                  onChanged: (text) => setState(() {
                    permanentAddressController.text = text;
                  }
                  ),
                  controller: permanentAddressController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Permanent Address",
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
                // Widget for Primary Phone Number
                TextFormField(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) => CustomDialogBox(
                            message: "Do you want to change the Primary Phone Number?",
                            bgcolors: Colors.blue.shade50,
                            title: "Change The Primary Phone Number?",
                            pageLink: AccountSetting()
                        )
                    );
                  },
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
                    primaryPhoneNoController.text = text;
                  }
                  ),
                  controller: primaryPhoneNoController,
                  readOnly: true,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Primary Phone Number",
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
                // Widget for Secondary Phone Number
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Secondary Phone Number can't be empty";
                    }
                    if (text.length<9){
                      return "Please enter a valid secondary Phone Number";
                    }
                    if (text.length>99){
                      return "Please enter a valid secondary Phone Number";
                    }
                  },
                  onChanged: (text) => setState(() {
                    secondaryPhoneNoController.text = text;
                  }
                  ),
                  controller: secondaryPhoneNoController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Secondary Phone Number",
                    // hintText: "Secondary Phone Number",
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
                // Widget for Emergency Phone Number
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Emergency Phone No No can't be empty";
                    }
                    if (text.length<9){
                      return "Please enter a valid Emergency Phone No";
                    }
                    if (text.length>99){
                      return "Please enter a valid Emergency Phone No";
                    }
                  },
                  onChanged: (text) => setState(() {
                    emergencyPhoneNoController.text = text;
                  }
                  ),
                  controller: emergencyPhoneNoController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Emergency Phone Number",
                    // hintText: "Emergency Phone Number",
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
                // Widget for Primary Email
                TextFormField(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) => CustomDialogBox(
                            message: "Do you want to change the Primary Email?",
                            bgcolors: Colors.blue.shade50,
                            title: "Change The Primary Email?",
                            pageLink: AccountSetting()
                        )
                    );
                  },
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
                    primaryEmailController.text = text;
                  }
                  ),
                  controller: primaryEmailController,
                  readOnly: true,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Primary Email",
                    // hintText: userEmail!,
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
                // Widget for Secondary Email
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Secondary Email No can't be empty";
                    }
                    if (text.length<9){
                      return "Please enter a valid Secondary Email";
                    }
                    if (text.length>99){
                      return "Please enter a valid Secondary Email";
                    }
                  },
                  onChanged: (text) => setState(() {
                    secondaryEmailController.text = text;
                  }
                  ),
                  controller: secondaryEmailController,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText:  "Secondary Email" ,
                    // hintText: "Secondary Email",
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

                ElevatedButton(
                  onPressed: (){
                    if (widget.CDetailsId == null){
                      if(_validateForm() == true) {
                        Navigator.pop(context);
                        _insertContactInfo();
                      }
                    }else {
                      if(_validateForm() == true) {
                        Navigator.pop(context);
                        _updateContactInfo();
                      }
                    }
                  },
                  child: (widget.CDetailsId == null)? Text("Submit") : Text("Update"),
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
