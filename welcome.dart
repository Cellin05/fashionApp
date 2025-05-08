import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/signin.dart';
import 'package:flutter_application_1/views/screens/signup.dart';
import 'package:flutter_application_1/widgets/custom_butoon.dart';
import 'package:flutter_application_1/widgets/custom_scafold.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    
  return CustomScaffold(
      child: Column(
        children: [
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: "Deone's Fashion!\n",
                            style: TextStyle(
                              fontSize: 35.0,
                              color:Colors.black,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text:
                                '\nDRIP TO YOUR CHOICE',
                            style: TextStyle(
                              fontSize: 20,
                              // height: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: Signin(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const Signup(),
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

