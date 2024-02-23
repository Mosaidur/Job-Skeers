import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Edit_Personatl_Details extends StatefulWidget {
  const Edit_Personatl_Details({super.key});

  @override
  State<Edit_Personatl_Details> createState() => _Edit_Personatl_DetailsState();
}

class _Edit_Personatl_DetailsState extends State<Edit_Personatl_Details> {
  // Create TextEditingController variables for the provided information
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  final TextEditingController passportNoController = TextEditingController();
  final TextEditingController passportIssueDateController = TextEditingController();
  final TextEditingController  bloodGroupController = TextEditingController() ;


  String? _selectedReligion;
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
                    hintText: "Father's Name*",
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
                    hintText: "Mother's Name*",
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
                    hintText: "Date of Birth*",
                    suffixIcon: IconButton(
                      onPressed: () => _selectDate(context),
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
                SizedBox(height: 20),

                // Religion form field
                DropdownButtonFormField<String>(
                  value: null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Religion*",
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
                  value: null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Gender*",
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
                  value: null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Marital Status*",
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
                  items: <String>['Married', 'Unmarried ']
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
                    hintText: "Nationality*",
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
                    hintText: "National ID No",
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
                    hintText: "Passport No",
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
                SizedBox(height: 20),

                // Passport Issue Date form field
                TextFormField(
                  onTap: () => _selectpassportIssueDate(context),
                  controller: passportIssueDateController,
                  readOnly: true,
                  enabled: true,
                  decoration: InputDecoration(
                    hintText: "Passport Issue Date",
                    suffixIcon: IconButton(
                      onPressed: () => _selectpassportIssueDate(context),
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
                SizedBox(height: 20),

                // Blood Group form field
                DropdownButtonFormField<String>(
                  value: null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: "Blood Group",
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
