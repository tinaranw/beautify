part of 'pages.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(24),
        child: Stack(
          children: [
            new RotationTransition(
              turns: new AlwaysStoppedAnimation(-45 / 360),
              child: new Image.asset(
                "assets/images/beautifylogo.png",
              ),
            ),
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 300),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Hey, beaute. \n Login Now.',
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Color(0xFF8ad5aa)),
                              ),
                            ),
                            SizedBox(height: 24),
                            TextFormField(
                              controller: ctrlEmail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(Icons.mail_outline_rounded),
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Please fill in the field!";
                                } else {
                                  if (!EmailValidator.validate(value)) {
                                    return "Email isn't valid!";
                                  } else {
                                    return null;
                                  }
                                }
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              controller: ctrlPassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.vpn_key_rounded),
                                  border: OutlineInputBorder(),
                                  suffixIcon: new GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    child: Icon(isVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                  )),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return value.length < 6
                                    ? "Password must have at least 6 characters!"
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      Navigator.pushNamed(
                                          context, MainMenu.routeName);
                                      Fluttertoast.showToast(
                                          msg: "Successfully logged in!");
                                    } else {
                                      //kosongkan aja bisa
                                      Fluttertoast.showToast(
                                          msg: "Please fill in the blanks!",
                                          backgroundColor: Colors.orangeAccent);
                                    }
                                  },
                                  icon: Icon(Icons.login),
                                  label: Text("Login"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFFff7a66)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      )))),
                            ),
                          ],
                        )),
                    SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Register.routeName);
                      },
                      child: SizedBox(
                          width: double.infinity,
                          child: Text("Not registered yet? Join now.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.deepOrange[400],
                                  fontSize: 16,
                                  fontFamily: 'SF'))),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
