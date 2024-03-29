import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/constant.dart';
import '../widgets/customAppBar.dart';
import 'package:http/http.dart' as http;

class ai extends StatefulWidget {
  const ai({super.key});

  @override
  State<ai> createState() => _aiState();
}

class _aiState extends State<ai> {
  String msg = "";
  @override
  void initState() {
    String url = 'https://api.deepai.org/api/text-generator';
    String apiKey = 'quickstart-QUdJIGlzIGNvbWluZy4uLi4K';

    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'api-key': apiKey,
    };

    Map<String, String> body = {
      'text':
          'marketing mail to buy a popular drink and the drink is pepsi company name is Smarket App',
    };

    http.post(Uri.parse(url), headers: headers, body: body).then((response) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      String output = jsonData['output'];
      print(output);
      setState(() {
        msg = output;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final supportTxt = TextEditingController(text: msg);
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomAppBar(
          title: "Recommendation",
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 260,
                    height: 120,
                    child: TextFormField(
                      showCursor: true,
                      cursorColor: myDarkGreen,
                      controller: supportTxt,
                      maxLines: 4,
                      style: const TextStyle(
                          fontFamily: "harabaraBold",
                          color: Color(0xff333333),
                          fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Tell Us how we can help ?',
                        labelStyle: const TextStyle(
                            fontFamily: "harabaraBold",
                            color: Color(0xff888888),
                            fontSize: 16),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 44, 105, 118)),
                            borderRadius: BorderRadius.circular(12.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 44, 105, 118)),
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  InkWell(
                    onTap: () async {
                      final Uri mailWithBody = Uri.parse(
                          "mailto:$supportMail?subject=Support&body=${supportTxt.text}");
                      if (!await launchUrl(mailWithBody,
                          mode: LaunchMode.externalApplication)) {
                        throw Exception('Could not launch $mailWithBody.');
                      }
                    },
                    child: Container(
                        width: 200,
                        padding: const EdgeInsets.fromLTRB(16, 9, 16, 9),
                        decoration: BoxDecoration(
                            color: const Color(0xff2C6976),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            textScaleFactor: 1,
                            "Send Message",
                            style: TextStyle(
                                fontFamily: "harabaraBold",
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
