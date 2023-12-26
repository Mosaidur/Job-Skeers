import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobSeekerHompage extends StatefulWidget {
  const JobSeekerHompage({super.key});

  @override
  State<JobSeekerHompage> createState() => _JobSeekerHompageState();
}

class _JobSeekerHompageState extends State<JobSeekerHompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [



                InkWell(
                  onTap: () async {
                    final url = Uri.parse("http://172.16.50.7/");

                    launchUrl(
                      url,
                      mode: LaunchMode.inAppWebView
                    );
                    //openBrowserURL (url:url, )
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.redAccent,
                    child: Center(
                      child: Text(
                        "Pub.Dev",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),

                // InkWell(
                //   onTap: () async {
                //     final url = "https://pub.dev/documentation/url_launcher/6.2.2/url_launcher/url_launcher-library.html";
                //
                //     // Parse the string URL into a Uri
                //     final uri = Uri.parse(url);
                //
                //     // Call launchUrl with the Uri
                //     launchUrl(
                //       uri,
                //       mode: LaunchMode.inAppBrowserView,
                //     );
                //   },
                //   child: Container(
                //     width: 100,
                //     height: 100,
                //     color: Colors.blue,
                //     child: Center(
                //       child: Text(
                //         "Pub.Dev",
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 22,
                //         ),
                //       ),
                //     ),
                //   ),
                // )




              ],
            )
          ],
        ),
      ),
    );
  }
}
