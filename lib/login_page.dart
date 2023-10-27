import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

TextEditingController textEditing_Email = TextEditingController();
TextEditingController textEditing_Password = TextEditingController();
TextEditingController textEditing_PhoneNumber = TextEditingController();
TextEditingController textEditing_FirstName = TextEditingController();
TextEditingController textEditing_lastName = TextEditingController();
bool male = true;

class _loginState extends State<login> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    String strData =
        'Create your Nike Member profile and get first access to the very best of Nike products, inspiration and community.';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/logo/Frame.png'),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Become a nike member'.toUpperCase(),
                        style: textTheme.bodyMedium!.copyWith(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Text(
                        strData,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium!.copyWith(
                            color: Color(0x40FFFFFF),
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: "Email Address"),
                          controller: textEditing_Email,
                          validator: (value) {
                            if (value == null || value == "")
                              return "Email Address is not Valid";
                          },
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Password"),
                          controller: textEditing_Password,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Phone Number"),
                          controller: textEditing_PhoneNumber,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "First Name"),
                          controller: textEditing_FirstName,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Last Name"),
                          controller: textEditing_lastName,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 19),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 49,
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              male = !male;
                            });
                          },
                          child: Text('Male', style: textTheme.bodyMedium),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(male
                                  ? Color(0xff42941B)
                                  : Color(0xff545458))),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        height: 49,
                        width: 170,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              male = !male;
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(male
                                  ? Color(0xff545458)
                                  : Color(0xff42941B))),
                          child: Text('Female', style: textTheme.bodyMedium),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 34),
                  SizedBox(
                    height: 48,
                    width: 393,
                    child: TextButton(
                      style: Theme.of(context).textButtonTheme.style!.copyWith(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffC66DF3))),
                      onPressed: () {
                        if (formkey.currentState!.validate()) SendDate();
                        else debugPrint('input Not Valid');
                      },
                      child: Text(
                        'join us',
                        style: textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a Member?',
                        style: TextStyle(color: Color(0xff64D2FF)),
                      ),
                      Text(' Sign in.'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future SendDate() async {
  var Url = Uri.parse('https://arshiyaradan.iran.liara.run/api/users-signup/');
  var strBody = <String, String>{
    "email": textEditing_Email.text,
    "password": textEditing_Password.text,
    "phone": textEditing_PhoneNumber.text,
    "first_name": textEditing_FirstName.text,
    "last_name": textEditing_lastName.text,
    "gender": male == true ? "male" : "Fmale"
  };
  var Response = await http.post(Url, body: strBody);
  debugPrint(Response.statusCode.toString());
  debugPrint(Response.body);
}
