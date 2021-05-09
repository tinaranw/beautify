part of 'pages.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool valuefirst = false;
  bool valuesecond = false;
  final _formKey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlPhone = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Register'),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(24),
                child: ListView(
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
                                SizedBox(height: 48),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Hey, loves. \n Sign up here.',
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
                                  controller: ctrlName,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: "Name",
                                    prefixIcon: Icon(Icons.person),
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please fill in the field!";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: ctrlPhone,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    labelText: "Phone",
                                    prefixIcon: Icon(Icons.phone),
                                    border: OutlineInputBorder(),
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please fill in the field!";
                                    } else {
                                      if (value.length < 7 ||
                                          value.length > 14) {
                                        return "Phone number is not valid!";
                                      }
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: ctrlEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    prefixIcon:
                                        Icon(Icons.mail_outline_rounded),
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
                                CheckboxListTile(
                                  subtitle: Text(
                                    'Would you like to receive news and updates sent to your email?',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF636263),
                                        fontFamily: 'SF'),
                                  ),
                                  value: this.valuefirst,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.valuefirst = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 48,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          Users users = new Users(
                                              "",
                                              ctrlName.text,
                                              ctrlPhone.text,
                                              ctrlEmail.text,
                                              ctrlPassword.text,
                                              "",
                                              "");
                                          await AuthServices.signUp(users)
                                              .then((value) {
                                            if (value == "success") {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              ActivityServices.showToast(
                                                  "Register Success",
                                                  Colors.green);
                                              Navigator.pushReplacementNamed(
                                                  context, Login.routeName);
                                            } else {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              ActivityServices.showToast(
                                                  value, Colors.red);
                                            }
                                          });
                                        } else {
                                          //kosongkan aja bisa
                                          Fluttertoast.showToast(
                                              msg: "Please fill in the blanks!",
                                              backgroundColor:
                                                  Colors.orangeAccent);
                                        }
                                      },
                                      icon: Icon(Icons.login),
                                      label: Text("Sign up"),
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
                        SizedBox(height: 12),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, Login.routeName);
                            },
                            child: Text("Already registered? Login here.",
                                style: TextStyle(
                                    color: Colors.deepOrange[400],
                                    fontSize: 16,
                                    fontFamily: 'SF')))
                      ],
                    ),
                  ],
                )),
            // isLoading == true ? ActivityServices.loadings() : Container()
          ],
        ),
      ),
    );
  }
}
