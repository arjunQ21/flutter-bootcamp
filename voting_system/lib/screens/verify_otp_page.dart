import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_system/components/global/custom_button.dart';
import 'package:voting_system/components/global/custom_textfield.dart';
import 'package:voting_system/providers/user_provider.dart';

class VerifyOTPPage extends StatefulWidget {
  const VerifyOTPPage({super.key});

  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  TextEditingController _otpCodeController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Verify OTP Page"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Verify its you.",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '''
We have sent an email to: 
${userProvider.user!.email}.
      
Please enter the code below to confirm its you.''',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextField(
                label: "OTP Code",
                placeholder: "OTP Code in email",
                handleValidation: (value) {
                  if (value == null) return "Required";
                  if (value.isEmpty) {
                    return "OTP Code is required";
                  }
                  if (value.length != 5) {
                    return "OTP Code must be 5 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                  name: "Confirm and Vote",
                  handleClicked: () {
                    if (_formKey.currentState!.validate()) {
                      print("Validated");
                    }
                  }),
            ]),
          ),
        ),
      );
    });
  }
}
