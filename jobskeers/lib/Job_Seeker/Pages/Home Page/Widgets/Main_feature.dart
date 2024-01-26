import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../loading_page.dart';
import '../../ComingSoon.dart';

class Mian_Feature extends StatelessWidget {
  const Mian_Feature({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height ,
      // height: 240 ,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  //Skill test logo and text
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {

                          final url = Uri.parse("https://skill.jobs/skill-assessment");
                          LoadingPage();
                          if (await launchUrl(
                            url,
                            mode: LaunchMode.inAppWebView,
                          )) {
                            throw Exception('Could not launch $url');
                          }

                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              child: Image.asset("assets/icons/Skill Test.png"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Skill Test",
                              style: TextStyle(
                                color: Color(0xff03438C),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "  ",
                              style: TextStyle(
                                color: Color(0xff03438C),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  //Learning & Training logo and text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {

                        final url = Uri.parse("https://training.skill.jobs/");
                        LoadingPage();
                        if (await launchUrl(
                          url,
                          mode: LaunchMode.inAppWebView,
                        )) {
                          throw Exception('Could not launch $url');
                        }

                      },

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Image.asset("assets/icons/Learning & trainning.png"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Learning &",
                            style: TextStyle(
                              color: Color(0xff03438C),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Training",
                            style: TextStyle(
                              color: Color(0xff03438C),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Career Toolkit logo and text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {

                        final url = Uri.parse("https://skill.jobs/career-toolkit");
                        LoadingPage();
                        if (await launchUrl(
                          url,
                          mode: LaunchMode.inAppWebView,
                        )) {
                          throw Exception('Could not launch $url');
                        }

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Image.asset("assets/icons/Career Toolkit.png"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Career",
                            style: TextStyle(
                              color: Color(0xff03438C),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Toolkit",
                            style: TextStyle(
                              color: Color(0xff03438C),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //Career Counseling logo and text
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon() ));

                        // final url = Uri.parse("https://skill.jobs/career-toolkit");
                        // LoadingPage();
                        // if (!await launchUrl(
                        //   url,
                        //   mode: LaunchMode.inAppWebView,
                        // )) {
                        //   throw Exception('Could not launch $url');
                        // }

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Image.asset("assets/icons/Careeer Counseling.png"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Career",
                            style: TextStyle(
                              color: Color(0xff03438C),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Counseling",
                            style: TextStyle(
                              color: Color(0xff03438C),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                //HR Guid logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {

                      final url = Uri.parse("https://skill.jobs/hr-guide");
                      LoadingPage();
                      if (await launchUrl(
                        url,
                        mode: LaunchMode.inAppWebView,
                      )) {
                        throw Exception('Could not launch $url');
                      }

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/icons/HR Guid.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "HR Guid",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "  ",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Popular job logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      LoadingPage();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon() ));

                      // final url = Uri.parse("https://skill.jobs/career-toolkit");
                      //
                      // if (!await launchUrl(
                      //   url,
                      //   mode: LaunchMode.inAppWebView,
                      // )) {
                      //   throw Exception('Could not launch $url');
                      // }

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/icons/Popular Job.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Popular",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "job",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Polupar Company logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon() ));

                      // final url = Uri.parse("https://skill.jobs/career-toolkit");
                      // LoadingPage();
                      // if (!await launchUrl(
                      //   url,
                      //   mode: LaunchMode.inAppWebView,
                      // )) {
                      //   throw Exception('Could not launch $url');
                      // }

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/icons/Popular Company.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Polupar",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Company",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Job Fair logo and text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {

                      //Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon() ));

                      final url = Uri.parse("https://jobutsob.daffodilvarsity.edu.bd/");
                      LoadingPage();
                      if (await launchUrl(
                        url,
                        mode: LaunchMode.inAppWebView,
                      )) {
                        throw Exception('Could not launch $url');
                      }

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/icons/job-fair.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Job Fair",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "  ",
                          style: TextStyle(
                            color: Color(0xff03438C),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //
          //       //NewsFeed logo and text
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Container(
          //               height: 40,
          //               width: 40,
          //               child: Image.asset("assets/icons/News Feed.png"),
          //             ),
          //             SizedBox(
          //               height: 5,
          //             ),
          //             Text(
          //               "NewsFeed",
          //               style: TextStyle(
          //                 color: Color(0xff03438C),
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             Text(
          //               "  ",
          //               style: TextStyle(
          //                 color: Color(0xff03438C),
          //                 fontSize: 15,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //
          //
          //
          //     ],
          //   ),
          // ),

        ],
      ),
    );
  }
}
