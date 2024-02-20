import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:explora_app/screens/Authentication/createaccount.dart';
import 'package:explora_app/screens/Authentication/verificationcode.dart';
import 'package:explora_app/utils/constants.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    // Schedule the checkConnectivity method to be called after the frame is built
    WidgetsBinding.instance!.addPostFrameCallback((_) => checkConnectivity());
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    String message = "";

    if (connectivityResult == ConnectivityResult.mobile) {
      message = "Connected to Mobile internet";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      message = "Connected to Wifi internet";
    } else {
      message = "No internet connection";
    }

    if (message.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 5),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Loading..."),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.toggle_off,
              size: 50,
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 65.0),
                      child: Image.asset(
                        'assets/Welcomeback.png',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Set the background color
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.grey[500],
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 30.0, top: 12.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Set the background color
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey[500],
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 30.0, top: 12.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (bool? value) {
                                      // Handle 'Remember Me' checkbox state
                                    },
                                    checkColor: Colors.red,
                                    activeColor: Colors.red,
                                  ),
                                ),
                              ),
                              const Text('Remember Me'),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle 'Forgot Password' action
                            },
                            child: const Text('Forgot Password?'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationCode(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Background color
                  onPrimary: Colors.white, // Text color
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10), // Button padding
                  textStyle: const TextStyle(fontSize: 16), // Text style
                  elevation: 4, // Elevation (shadow)
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // Button border radius
                  ),
                ),
                child: const Text("Next"),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "New Member?",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAccount(),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: Text(
                      "Register now",
                      style: TextStyle(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 270,
            ),
            StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
                if (snapshot.hasData) {
                  // You can call checkConnectivity here if needed
                  checkConnectivity();
                  ConnectivityResult? result = snapshot.data;
                  String message = "";
                  if (result == ConnectivityResult.mobile) {
                    message = "Connected to Mobile internet";
                  } else if (result == ConnectivityResult.wifi) {
                    message = "Connected to Wifi internet";
                  } else {
                    message = "No internet connection";
                  }
                  if (message.isNotEmpty) {
                    // Show SnackBar using ScaffoldMessenger
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        duration: const Duration(seconds: 5),
                      ),
                    );
                  }
                } else {
                  // Show loading SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Loading..."),
                      duration: Duration(seconds: 5),
                    ),
                  );
                }
                // Return an empty container since you don't want to render anything
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}