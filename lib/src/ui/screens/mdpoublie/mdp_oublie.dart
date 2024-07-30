import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/ui/screens/login/login.dart';
import 'package:hizboufront/src/ui/screens/otp/otp.dart';
import 'package:hizboufront/utils/customelevatedbutton.dart';
import 'package:hizboufront/utils/title.dart';
import 'package:hizboufront/utils/titleoption.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MdpOublie extends StatefulWidget {
  const MdpOublie({super.key});

  @override
  State<MdpOublie> createState() => _MdpOublieState();
}

class _MdpOublieState extends State<MdpOublie> {
  late TextEditingController matriculeController;
  bool isactive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matriculeController = TextEditingController();
    matriculeController.addListener(updateActiveState);
  }

  void updateActiveState() {
    final isActive =
        matriculeController.text.isNotEmpty ;
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
                  MaterialPageRoute(builder: (context) => const Login()),
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
                data: 'Mot de passe oublie',
                color: AppColors.title,
                size: 30,
                weight: FontWeight.w400),
            TitleText(data: "Ne vous inquiétez pas ! Cela arrive. Veuillez entrer le matricule associée à votre compte.", color: const Color.fromRGBO(106, 112, 124, 1), size: 14, weight: FontWeight.w600, maxLines: 2, overflow: TextOverflow.clip, fontFamily: 'Urbanist' ,textAlign: TextAlign.left ,),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                /* border: Border.all(
                  color: AppColors.green1
                ) */
              ),
              height: 50,
              child: TextField(
                controller: matriculeController,
                onChanged: (value) {
                  updateActiveState();
                },
                decoration: InputDecoration(
                  hintText: 'Entrer votre matricule ',
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
                keyboardType: TextInputType.none,
              ),
            ),
            const SizedBox(height: 40,),
            CustomElevatedButton(backgroundColor: AppColors.green1, borderColor: AppColors.green1, borderRadius: 8,
            width: double.infinity, height: 58, onPressed: isactive ? (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Otp()),
              );
            } : (){}, titleText: TitleText(
                data: 'changer',
                color: Colors.white,
                size: 15,
                weight: FontWeight.w400,
                maxLines: 1,
                overflow: TextOverflow.clip,
                fontFamily: 'Urbanist',
              ),
            ),
                

                

          ],
        ),
      )),
    
      
    );
  }
}