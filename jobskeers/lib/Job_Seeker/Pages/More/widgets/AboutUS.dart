import 'package:flutter/cupertino.dart';

class AboutUsCategory extends StatefulWidget {
  const AboutUsCategory({super.key});

  @override
  State<AboutUsCategory> createState() => _AboutUsCategoryState();
}

class _AboutUsCategoryState extends State<AboutUsCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height ,
      // height: 120 ,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                //Rate Us logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/RateUs.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Rate Us",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " ",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //Feedback and Support logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/Feedback and Support.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Feedback &",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Support",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //Privacy Policy logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/Privacy Policy.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Privacy",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Policy",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                //Terms & Conditions logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/Images2/Terms & Conditions.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Terms &",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Conditions",
                        style: TextStyle(
                          color: Color(0xff03438C),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
