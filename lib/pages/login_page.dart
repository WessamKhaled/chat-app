import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) :super(key: key);
  static String id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: ListView(
              
              children: [
            
                SizedBox(
                  height: 70,
                ),
                Image.asset(kLogo,
                height: 100,
                ),
            
                Center(
                  child: Text("Scholar Chat",
                    style: TextStyle(color: Colors.white,
                      fontSize: 32,
                      fontFamily: 'Pacifico'
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
            
                Row(
            
                  children: [
                    Text("LOGIN",
                      style: TextStyle(color: Colors.white,
                          fontSize: 20,
            
                      ),
                    ),
                  ],
                ),
            
                SizedBox(
                  height: 10,
                ),
            
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
            
                SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
            
                SizedBox(
                  height: 25,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {
                        
                      });
                      try {
                        await LoginUser();
                        Navigator.pushNamed(context, ChatPage.id,arguments: email);
                        // await LoginUser();
                        // Navigator.pushNamed(context, ChatPage.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == "user-not-found") {
                          showSnackBar(context, "user-not-found");
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,'wrong-password');
                        }
                      } catch (e) {
                        showSnackBar(
                            context, "there was an error,please try later..");
                      }
                      isLoading = false;
                      setState(() {
                        
                      });
                      
                    }
                    else{

                    }
                  },
                  
                  textButton: "LOGIN",
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don't have an account ? ",
                      style: TextStyle(color: Colors.white,
                        fontSize: 16,
            
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id,);
                      },
                      child: Text(" Register",
                        style: TextStyle(color: Colors.white,
                          fontSize: 17,
            
                        ),
                      ),
                    ),
            
                  ],
            
                ),
            
              ],
            
            ),
          ),
      
        ),
      
      ),
    );
  }




  Future<void> LoginUser() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

}