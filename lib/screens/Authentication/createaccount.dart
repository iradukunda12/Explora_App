import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:explora_app/screens/Authentication/login.dart';
import 'package:explora_app/screens/Authentication/verificationcode.dart';
import 'package:explora_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
      // Show SnackBar using ScaffoldMessenger
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 5),
        ),
      );
    } else {
      // Show loading SnackBar
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
                        'assets/getstarted.png',
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
                          hintText: 'Fullname',
                          suffixIcon: Icon(
                            Icons.person_sharp,
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
                          hintText: 'Valid email',
                          suffixIcon: Icon(
                            Icons.mail,
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
                          hintText: 'Phone Number',
                          suffixIcon: Icon(
                            Icons.phone,
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
                          hintText: 'Strong Password',
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
                    SizedBox(height: 8.0),
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
                              const Text(
                                  'Do You agree to our Terms and Conditions.'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 350,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginForm(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(fontSize: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
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
                  "Already a Member?",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginForm(),
                      ),
                    );
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: primaryColor,
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
                  // checkConnectivity();
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        duration: const Duration(seconds: 5),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Loading..."),
                      duration: Duration(seconds: 5),
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
