import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Job_Seeker/Pages/Profile/Account%20Settings/account_settings.dart';
import 'package:jobskeers/Job_Seeker/customDialogBox.dart';

class Edit_Contact_Details extends StatefulWidget {
  const Edit_Contact_Details({super.key});

  @override
  State<Edit_Contact_Details> createState() => _Edit_Contact_DetailsState();
}

class _Edit_Contact_DetailsState extends State<Edit_Contact_Details> {

  // Creating text editing controllers for the provided information
  final TextEditingController presentAddressController = TextEditingController();
  final TextEditingController permanentAddressController = TextEditingController();
  final TextEditingController primaryPhoneNoController = TextEditingController();
  final TextEditingController secondaryPhoneNoController = TextEditingController();
  final TextEditingController emergencyPhoneNoController = TextEditingController();
  final TextEditingController primaryEmailController = TextEditingController();
  final TextEditingController secondaryEmailController = TextEditingController();

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
                    hintText: "Present Address",
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
                    hintText: "Permanent Address",
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
                    hintText: "Primary Phone Number",
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
                // Widget for Secondary Phone Number
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
                    secondaryPhoneNoController.text = text;
                  }
                  ),
                  controller: secondaryPhoneNoController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Secondary Phone Number",
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
                // Widget for Emergency Phone Number
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
                    emergencyPhoneNoController.text = text;
                  }
                  ),
                  controller: emergencyPhoneNoController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Emergency Phone Number",
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
                    hintText: "Primary Email",
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
                // Widget for Secondary Email
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
                    secondaryEmailController.text = text;
                  }
                  ),
                  controller: secondaryEmailController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Secondary Email",
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
