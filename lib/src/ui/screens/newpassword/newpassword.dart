import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/ui/screens/mdpoublie/mdp_oublie.dart';
import 'package:hizboufront/src/ui/screens/otp/otp.dart';
import 'package:hizboufront/utils/customelevatedbutton.dart';
import 'package:hizboufront/utils/title.dart';
import 'package:hizboufront/utils/titleoption.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  late TextEditingController confirmPasswordController;
  late TextEditingController passwordController;
  bool isactive = false;
  bool isPasswordVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    confirmPasswordController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController.addListener(updateActiveState);
    passwordController.addListener(updateActiveState);
  }

  void updateActiveState() {
    final isActive =
        confirmPasswordController.text.isNotEmpty && passwordController.text.isEmpty;
    setState(() {
      isactive = isActive;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
  
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Otp()),
                );
              },
              child: Image.asset(
                'images/back.png',
                width: 41,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TitleOption(
                data: 'Mot de passe',
                color: AppColors.title,
                size: 30,
                weight: FontWeight.w400),
            const SizedBox(
              height: 40,
            ),
            Container(
                //color: Colors.white,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 50,
                child: TextFormField(
                  controller: passwordController,
                  onChanged: (value) {
                    updateActiveState();
                  },
                  decoration: InputDecoration(
                    hintText: 'nouveau mot de passe',
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
                )),
            const SizedBox(
              height: 40,
            ),
            Container(
            //color: Colors.white,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: 50,
            child: TextFormField(
              controller: confirmPasswordController,
              onChanged: (value) {
                updateActiveState();
              },
              decoration: InputDecoration(
                hintText: 'confirmation mot de passe',
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
            )),
            const SizedBox(
              height: 40,
            ),
            CustomElevatedButton(
              backgroundColor: AppColors.green1,
              borderColor: AppColors.green1,
              borderRadius: 8,
              width: double.infinity,
              height: 58,
              onPressed: isactive ? () {} : () {},
              titleText: TitleText(
                data: 'Connexion',
                color: Colors.white,
                size: 15,
                weight: FontWeight.w400,
                maxLines: 1,
                overflow: TextOverflow.clip,
                fontFamily: 'Urbanist',
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(
                    data: 'Vous navez pas recu ? ',
                    color: const Color.fromRGBO(106, 112, 124, 1),
                    size: 15,
                    weight: FontWeight.w600,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    fontFamily: 'Urbanist'),
                GestureDetector(
                  onTap: () {},
                  child: TitleText(
                      data: 'Renvoyer',
                      color: AppColors.green1,
                      size: 15,
                      weight: FontWeight.w600,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      fontFamily: 'Urbanist'),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
