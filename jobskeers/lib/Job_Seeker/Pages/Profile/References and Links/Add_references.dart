import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Add_references extends StatefulWidget {
  const Add_references({super.key});

  @override
  State<Add_references> createState() => _Add_referencesState();
}

class _Add_referencesState extends State<Add_references> {

  final TextEditingController referencesNameController = TextEditingController();
  final TextEditingController referencesOrganizationController = TextEditingController();
  final TextEditingController referencesDesignationController = TextEditingController();
  final TextEditingController referencesAddressController = TextEditingController();
  final TextEditingController referencesPhoneNoOfficeController = TextEditingController();
  final TextEditingController referencesMobileNoController = TextEditingController();
  final TextEditingController referencesEmailController = TextEditingController();
  final TextEditingController referencesRelationController = TextEditingController();

  String? _selectedreferencesRelation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add References"),
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

                // References Name
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "References Name can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid References Name";
                    }
                  },
                  onChanged: (text) => setState(() {
                    referencesNameController.text = text;
                  }
                  ),
                  controller: referencesNameController,
                  maxLines: 2,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "References Name*",
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

                //Organization
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Organization Name can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Organization Name";
                    }
                  },
                  onChanged: (text) => setState(() {
                    referencesOrganizationController.text = text;
                  }
                  ),
                  controller: referencesOrganizationController,
                  maxLines: 2,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Organization*",
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

                //Designation
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "References Designation can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid References Designation";
                    }
                  },
                  onChanged: (text) => setState(() {
                    referencesDesignationController.text = text;
                  }
                  ),
                  controller: referencesDesignationController,
                  maxLines: 2,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "References Designation*",
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

                // Address
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "References Address can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid References Address";
                    }
                  },
                  onChanged: (text) => setState(() {
                    referencesAddressController.text = text;
                  }
                  ),
                  controller: referencesAddressController,
                  maxLines: 2,
                  minLines: 1,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "References Address*",
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

                //Phone_no
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Phone No can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Phone No";
                    }
                  },
                  onChanged: (text) => setState(() {
                    referencesPhoneNoOfficeController.text = text;
                  }
                  ),
                  controller: referencesPhoneNoOfficeController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "References Phone No (Office)*",
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

                //Mobile No
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Mobile No can't be empty";
                    }
                    if (text.length<9){
                      return "Please enter a valid Mobile No";
                    }
                  },
                  onChanged: (text) => setState(() {
                    referencesMobileNoController.text = text;
                  }
                  ),
                  controller: referencesMobileNoController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "References Mobile No*",
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

                //Email Address
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (text){
                    if (text == null || text.isEmpty){
                      return "Email Address can't be empty";
                    }
                    if (text.length<3){
                      return "Please enter a valid Email Address";
                    }
                  },
                  onChanged: (text) => setState(() {
                    referencesEmailController.text = text;
                  }
                  ),
                  controller: referencesEmailController,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "References Email Address*",
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

                // Relation
                DropdownButtonFormField<String>(
                  value: null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Relation*",
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
                    'Relative',
                    'Family Friend',
                    'Academic',
                    'Professional',
                    'Others',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedreferencesRelation = newValue!;
                      referencesRelationController.text = newValue;
                    });
                  },
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
