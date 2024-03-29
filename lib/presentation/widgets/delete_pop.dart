import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/constant.dart';

Future openDialog(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext contex) {
      return AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        content: Container(
          height: 125,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/logout.svg",
                    color: const Color(0xff444444),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    textScaleFactor: 1,
                    "Signout",
                    style: TextStyle(
                        fontFamily: "harabaraBold",
                        fontSize: 18,
                        color: Color(0xff444444)),
                  ),
                ],
              ),
              const Text(
                textScaleFactor: 1,
                "Are you sure want to logout ?",
                style: TextStyle(
                    fontFamily: "harabara",
                    fontSize: 16,
                    color: Color(0xff666666)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() => Navigator.pop(context)),
                    child: Container(
                      height: 36,
                      width: 84,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xff888888)),
                          color: Colors.white),
                      child: const Center(
                        child: Text(
                          textScaleFactor: 1,
                          "Cancel",
                          style: TextStyle(
                              fontFamily: "harabaraBold",
                              fontSize: 16,
                              color: Color(0xff888888)),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushReplacementNamed(context, "home"),
                    child: Container(
                      height: 36,
                      width: 84,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: myDarkGreen),
                      child: const Center(
                        child: Text(
                          textScaleFactor: 1,
                          "Logout",
                          style: TextStyle(
                              fontFamily: "harabaraBold",
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
