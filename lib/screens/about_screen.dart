import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 30),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height / 30),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Introducing our enhanced contact management solution. You might be asking yourself, 'Why do we need this when we already have a contact manager?' The answer is simple: our solution offers unparalleled efficiency and a seamless user experience. It is designed to be more intuitive, smoother, and more reliable than any other contact management system you have used before. With advanced features and a user-friendly interface, it simplifies the way you manage your contacts, ensuring you have quick and easy access to the information you need.",
                        style: TextStyle(
                          fontFamily: "Poppins-Light",
                          fontSize: MediaQuery.sizeOf(context).height / 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 30,
                    ),
                    Text(
                      "Created by",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height / 40),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 60,
                    ),
                    MyInfo(context, "Ehtiram Ullah"),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 60,
                    ),
                    Text(
                      "Contact Number",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height / 40),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 60,
                    ),
                    GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                              const ClipboardData(text: "03450551501"));
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Phone number copied to clipboard",
                              style: TextStyle(
                                  fontFamily: "Poppins-Light",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.sizeOf(context).height / 50),
                            ),
                            duration: const Duration(seconds: 2),
                            backgroundColor:
                                const Color.fromARGB(255, 243, 238, 238),
                            // animation: AnimationController(vsync: ) ,
                            // elevation: 15,
                          ));
                        },
                        child: MyInfo(context, "0345-0551501")),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Text MyInfo(BuildContext context, String txt) {
    return Text(
      txt,
      style: TextStyle(
          fontSize: MediaQuery.sizeOf(context).height / 45,
          fontFamily: "Poppins-Light",
          fontWeight: FontWeight.bold),
    );
  }
}
