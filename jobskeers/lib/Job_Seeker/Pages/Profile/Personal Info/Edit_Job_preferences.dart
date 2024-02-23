import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobskeers/Job_Seeker/CustomSnackbar.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

class Edit_Job_preferences extends StatefulWidget {
  const Edit_Job_preferences({super.key});

  @override
  State<Edit_Job_preferences> createState() => _Edit_Job_preferencesState();
}

class _Edit_Job_preferencesState extends State<Edit_Job_preferences> {
  TextEditingController prefFuncJobCatController = TextEditingController();
  TextEditingController prefSpecialSkilledJobCatController = TextEditingController();
  TextEditingController prefOrgTypeController = TextEditingController();
  TextEditingController prefJobLocationController = TextEditingController();

  TextEditingController presentSalaryController = TextEditingController();
  TextEditingController expectedSalaryController = TextEditingController();
  TextEditingController jobLevelController = TextEditingController();
  TextEditingController jobNatureController = TextEditingController();


  String? _selectedJobLevel;
  String? _selectedJobNature;
  String? _selectedDivision;
  final List prefFuncJob = const [
    "Software Development",
    "Data Science & Analytics",
    "Marketing & Communications",
    "Finance & Accounting",
    "Human Resources",
    "Operations & Supply Chain Management",
    "Healthcare & Pharmaceuticals",
    "Education & Training",
    "Legal Services",
    "Customer Service & Support",
  ];
  List? selectedprefFuncJob = const [];

  final List prefSpecialSkilledJob = const [
    'Information Technology',
    'Engineering (Civil, Electrical, Mechanical)',
    'Medical and Healthcare Professionals',
    'Finance and Accounting',
    'Textile and Garment Industry',
    'Agriculture and Agribusiness',
    'Energy and Renewable Resources',
    'Telecommunications',
    'Transportation and Logistics',
    'Hospitality and Tourism',
  ];
  List? selectedprefSpecialSkilledJob = const [];

  final List prefOrgType = const [
    'Multinational Corporations',
    'Government Agencies',
    'Non-Governmental Organizations (NGOs)',
    'Research Institutions',
    'Financial Institutions',
    'Healthcare Organizations',
    'Educational Institutions',
    'Manufacturing Companies',
    'Information Technology (IT) Companies',
    'Agricultural Enterprises',
    'Energy and Utilities Companies',
    'Telecommunication Companies',
    'Textile and Garment Industries',
    'Transportation and Logistics Companies',
    'Hospitality and Tourism Companies',
  ];
  List? selectedprefOrgType = const [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Edit Job Preferences"),
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
                  Text(
                    "Career and Application Details",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Widget for Present Salary
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Present Salary can't be empty";
                      }
                      if (text.length < 3) {
                        return "Please enter a valid Present Salary";
                      }
                    },
                    onChanged: (text) => setState(() {
                      presentSalaryController.text = text;
                    }),
                    controller: presentSalaryController,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: "Present Salary",
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

                  SizedBox(
                    height: 20,
                  ),
                  // Widget for Expected Salary
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(100),
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "Expected Salary can't be empty";
                      }
                      if (text.length < 3) {
                        return "Please enter a valid Expected Salary";
                      }
                      if (text.length > 99) {
                        return "Please enter a valid Expected Salary";
                      }
                    },
                    onChanged: (text) => setState(() {
                      expectedSalaryController.text = text;
                    }),
                    controller: expectedSalaryController,
                    enabled: true,
                    decoration: InputDecoration(
                      hintText: "Expected Salary",
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

                  SizedBox(
                    height: 20,
                  ),
                  // Widget for Job Level
                  DropdownButtonFormField<String>(
                    value: null,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Job Level",
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
                      'Entry Level Job',
                      'Mid Level Job',
                      'Top Level Job'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedJobLevel = newValue!;
                        jobLevelController.text = newValue;
                      });
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // Widget for job nature
                  DropdownButtonFormField<String>(
                    value: null,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Job Nature",
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
                      'Full Time',
                      'Part Time',
                      'Contractual',
                      'Internship',
                      'Freelance'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedJobNature = newValue!;
                        jobNatureController.text = newValue;
                      });
                    },
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Preferred Job Areas",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Widget for Preferred Functional Job Categories
                  MultiSelectDropdown.simpleList(
                    list: prefFuncJob,
                    initiallySelected: const [],
                    onChange: (newList) {
                      setState(() {
                        selectedprefFuncJob = newList;
                        // if(selectedprefFuncJob!.length > 3){
                        //   CustomSnackBar.show(context,
                        //       message: "You can choose maximum 3 Functional job categories",
                        //       backgroundColor: Colors.red.shade400,
                        //       actionLabel: "Choose maximum 3",
                        //       onActionPressed: FocusScope.of(context).unfocus );
                        // }else{
                        //   selectedprefFuncJob = newList;
                        // }
                      });
                    },
                    includeSearch: true,
                    includeSelectAll: true,
                    checkboxFillColor: Colors.grey,
                    whenEmpty: "Preferred Functional Job Categories",
                    // splashColor: Colors.blue,
                  ),

                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      children: selectedprefFuncJob!
                          .map((item) => Chip(
                                label: Text(item.toString()),
                              ))
                          .toList(),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Widget for Preferred Special Skilled Job Categories
                  MultiSelectDropdown.simpleList(
                    list: prefSpecialSkilledJob,
                    initiallySelected: const [],
                    onChange: (newList) {
                      setState(() {
                        selectedprefSpecialSkilledJob = newList;
                        // if(selectedprefFuncJob!.length > 3){
                        //   CustomSnackBar.show(context,
                        //       message: "You can choose maximum 3 Functional job categories",
                        //       backgroundColor: Colors.red.shade400,
                        //       actionLabel: "Choose maximum 3",
                        //       onActionPressed: FocusScope.of(context).unfocus );
                        // }else{
                        //   selectedprefFuncJob = newList;
                        // }
                      });
                    },
                    includeSearch: true,
                    includeSelectAll: true,
                    checkboxFillColor: Colors.grey,
                    whenEmpty: "Preferred Special Skilled Job Categories",
                    // splashColor: Colors.blue,
                  ),

                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      children: selectedprefSpecialSkilledJob!
                          .map((item) => Chip(
                                label: Text(item.toString()),
                              ))
                          .toList(),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // Widget for Preferred Organization Type
                  MultiSelectDropdown.simpleList(
                    list: prefOrgType,
                    initiallySelected: const [],
                    onChange: (newList) {
                      setState(() {
                        selectedprefOrgType = newList;
                        // if(selectedprefFuncJob!.length > 3){
                        //   CustomSnackBar.show(context,
                        //       message: "You can choose maximum 3 Functional job categories",
                        //       backgroundColor: Colors.red.shade400,
                        //       actionLabel: "Choose maximum 3",
                        //       onActionPressed: FocusScope.of(context).unfocus );
                        // }else{
                        //   selectedprefFuncJob = newList;
                        // }
                      });
                    },
                    includeSearch: true,
                    includeSelectAll: true,
                    checkboxFillColor: Colors.grey,
                    whenEmpty: "Preferred Organization Type",
                    // splashColor: Colors.blue,
                  ),

                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Wrap(
                      spacing: 8.0,
                      children: selectedprefOrgType!
                          .map((item) => Chip(
                                label: Text(item.toString()),
                              ))
                          .toList(),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // Widget for  Preferred Job Location
                  DropdownButtonFormField<String>(
                    value: null,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Preferred Job Location",
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
                      'Dhaka Division',
                      'Chittagong Division',
                      'Khulna Division',
                      'Rajshahi Division',
                      'Barisal Division',
                      'Sylhet Division',
                      'Rangpur Division',
                      'Mymensingh Division',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDivision = newValue!;
                        prefJobLocationController.text = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(
                          0xff03438C), // Change this color to your desired color
                    ),
                  ),

                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ));
  }
}
