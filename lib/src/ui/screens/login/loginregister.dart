import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/ui/screens/login/login.dart';
import 'package:hizboufront/utils/customelevatedbutton.dart';
import 'package:hizboufront/utils/title.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100 ,horizontal: 20),
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Image.asset('images/logo1.png'),
                ), 
              ),
              const Spacer() ,
              CustomElevatedButton(backgroundColor: AppColors.green1, borderColor: AppColors.green1, borderRadius: 8,
               width: double.infinity, height: 58, onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
               }, titleText: TitleText(
                  data: 'Connexion',
                  color: Colors.white,
                  size: 15,
                  weight: FontWeight.w400,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  fontFamily: 'Urbanist',
                ),
              ),
              const SizedBox(height: 15,),
              CustomElevatedButton(backgroundColor: AppColors.yellow, borderColor: AppColors.green1, borderRadius: 8,
               width: double.infinity, height: 58, onPressed: (){}, titleText: TitleText(
                  data: 'Inscription',
                  color: AppColors.green1,
                  size: 15,
                  weight: FontWeight.w400,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}