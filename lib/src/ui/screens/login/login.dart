import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/core/methods/common_methods.dart';
import 'package:hizboufront/src/core/models/requests/login_request.dart';
import 'package:hizboufront/src/core/providers/auth_provider.dart';
import 'package:hizboufront/src/ui/screens/mdpoublie/mdp_oublie.dart';
import 'package:hizboufront/utils/customelevatedbutton.dart';
import 'package:hizboufront/utils/title.dart';
import 'package:hizboufront/utils/titleoption.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController matriculeController;
  late TextEditingController passwordController;
  bool isactive = false;
  bool isPasswordVisible = false;
  final CommonMethods commonMethods = CommonMethods();

  @override
  void initState() {
    super.initState();
    matriculeController = TextEditingController();
    passwordController = TextEditingController();
    matriculeController.addListener(updateActiveState);
    passwordController.addListener(updateActiveState);
  }

  void updateActiveState() {
    final isActive = matriculeController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
    setState(() {
      isactive = isActive;
    });
  }

  @override
  void dispose() {
    super.dispose();
    matriculeController.dispose();
    passwordController.dispose();
  }

  login() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    LoginRequest loginRequest = LoginRequest(
        username: matriculeController.text,
        password: passwordController.text,
        clientId: 'ht-pub',
        grantType: 'password');
    var result = ap.loginProvider(loginRequest, context);
    print('--------- LOGIN CALL API -------------');
    //getMemberinFo();
    return result;
  }

  checkConnectivity() {
    print('---------------- Hello ------------------');
    commonMethods.checkConnectivity(context);
    login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'images/back.png',
                  width: 41,
                ),
              ),
              SizedBox(height: 40),
              TitleOption(
                  data: 'DALAL AK DIAM',
                  color: AppColors.title,
                  size: 30,
                  weight: FontWeight.w400),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: TextField(
                  controller: matriculeController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your matricule',
                    labelStyle: const TextStyle(color: Colors.black38),
                    fillColor: AppColors.green1,
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 3.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
              SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: TextFormField(
                  controller: passwordController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: InputDecoration(
                    hintText: 'Entrer votre code',
                    fillColor: Colors.white,
                    focusColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 3.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(height: 40),
              CustomElevatedButton(
                backgroundColor: AppColors.green1,
                borderColor: AppColors.green1,
                borderRadius: 8,
                width: double.infinity,
                height: 58,
                onPressed: isactive
                    ? () {
                        checkConnectivity();
                      }
                    : () {
                        //checkConnectivity();
                      },
                titleText: TitleText(
                  data: 'Connexion',
                  color: Colors.white,
                  size: 15,
                  weight: FontWeight.w400,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  fontFamily: 'Poppins',
                ),
              ),
             /*  SizedBox(height: 20), // Added spacing to avoid overflow
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText(
                      data: 'Vous navez pas de compte ? ',
                      color: Color.fromRGBO(106, 112, 124, 1),
                      size: 15,
                      weight: FontWeight.w600,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      fontFamily: 'Poppins'),
                  GestureDetector(
                    onTap: () {},
                    child: TitleText(
                        data: 'Inscription',
                        color: AppColors.green1,
                        size: 15,
                        weight: FontWeight.w600,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        fontFamily: 'Poppins'),
                  )
                ],
              )
             */],
          ),
        ),
      ),
    );
  }
}
