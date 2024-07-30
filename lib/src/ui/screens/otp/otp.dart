import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/ui/screens/login/login.dart';
import 'package:hizboufront/src/ui/screens/newpassword/newpassword.dart';
import 'package:hizboufront/utils/customelevatedbutton.dart';
import 'package:hizboufront/utils/title.dart';
import 'package:hizboufront/utils/titleoption.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late TextEditingController matriculeController;
  bool isactive = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matriculeController = TextEditingController();
    matriculeController.addListener(updateActiveState);
  }

  void updateActiveState() {
    final isActive = matriculeController.text.isNotEmpty;
    setState(() {
      isactive = isActive;
    });
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Image.asset(
                'images/back.png',
                width: 41,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TitleOption(
                data: 'Verification Otp',
                color: AppColors.title,
                size: 30,
                weight: FontWeight.w400),
            TitleText(
              data:
                  "Votre nouveau mot de passe doit être différent de ceux utilisés précédemment.",
              color: Color.fromRGBO(106, 112, 124, 1),
              size: 14,
              weight: FontWeight.w600,
              maxLines: 2,
              overflow: TextOverflow.clip,
              fontFamily: 'Urbanist',
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 40,
            ),
           Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 30,
                ),
                child: PinCodeTextField(
                  controller: otpController,
                  appContext: context,
                  length: 4,
                  onCompleted: (value) {
                    //authProvider.authMobileResponse!.codeAuto = value;
                    // otpSaisitState.updateOtpSaisit(value);
                    setState(() {
                      currentText = value;
                      isactive = true;
                    });
                  },
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    selectedFillColor: AppColors.green1,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    activeColor: AppColors.green1,
                    activeFillColor: Colors.white,
                    disabledColor: Colors.grey,
                    inactiveColor: Colors.grey,
                    selectedColor: AppColors.green1 ,
                    inactiveFillColor: Colors.grey,
                    fieldHeight: 48,
                    fieldWidth: 48,
                  ),
                  keyboardType: TextInputType.number,
                ), 
              ),
            ),
            SizedBox(
              height: 80,
            ),
            CustomElevatedButton(
              backgroundColor: AppColors.green1,
              borderColor: AppColors.green1,
              borderRadius: 8,
              width: double.infinity,
              height: 58,
              onPressed: isactive ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewPassword()),
                );
              } : () {},
              titleText: TitleText(
                data: 'Envoyer',
                color: Colors.white,
                size: 15,
                weight: FontWeight.w400,
                maxLines: 1,
                overflow: TextOverflow.clip,
                fontFamily: 'Urbanist',
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleText(
                    data: 'Pas recu de code ? ',
                    color: Color.fromRGBO(106, 112, 124, 1),
                    size: 15,
                    weight: FontWeight.w600,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    fontFamily: 'Urbanist'),
                GestureDetector(
                  onTap: () {},
                  child: TitleText(
                      data: 'Renvoie',
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
