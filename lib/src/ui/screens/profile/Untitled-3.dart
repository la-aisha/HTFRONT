import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/core/methods/common_methods.dart';
import 'package:hizboufront/src/core/models/response/member_response.dart';
import 'package:hizboufront/src/core/providers/auth_provider.dart';
import 'package:hizboufront/utils/loader_widget.dart';
import 'package:hizboufront/utils/title.dart';
import 'package:hizboufront/utils/titleoption.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CommonMethods commonMethods = CommonMethods();
  late Future<MemberResponse?> memberFuture;
  late bool isPressed = false;
  bool isValidNumber = false;
  PhoneNumber number = PhoneNumber(isoCode: '');
  final TextEditingController phoneController = TextEditingController();

  Future<MemberResponse?> fetchMemberInfo() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String token = ap.token;
    return await ap.getMemberinfoProvider(token, context);
  }

  @override
  void initState() {
    super.initState();
    fetchInitialISOCode().then((isoCode) {
      setState(() {
        number = PhoneNumber(isoCode: isoCode);
      });
    });
    memberFuture = fetchMemberInfo(); // Initialize future here
  }

  Future<String> fetchInitialISOCode() async {
    await Future.delayed(Duration(seconds: 1));
    return 'SN';
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isTablet = width > 600;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.green1,
      body: SafeArea(
        child: FutureBuilder<MemberResponse?>(
          future: memberFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Stack(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      height: height * 0.3,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned.fill(
                    top: height * 0.30,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 32.0 : 20.0,
                          vertical: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No data available', style: TextStyle(color: Colors.black)),
              );
            } else {
              final memberResponse = snapshot.data!;
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          height: height * 0.5,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.yellow,
                                ),
                                width: double.infinity,
                                height: height * 0.2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          profilePicture,
                                          height: 100,
                                          width: 100,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TitleOption(
                                              data: '${memberResponse.prenom} ${memberResponse.nom}',
                                              color: AppColors.green1,
                                              size: 24,
                                              weight: FontWeight.bold,
                                            ),
                                            SizedBox(height: 10),
                                            TitleText(
                                              data: '${memberResponse.matricule}',
                                              color: Colors.green,
                                              size: 16,
                                              weight: FontWeight.normal,
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                              fontFamily: 'Sen',
                                            ),
                                            SizedBox(height: 20),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: 200,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(217, 217, 217, 1),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    TitleText(
                                                      data: 'Modifier profil',
                                                      color: Color.fromRGBO(70, 78, 87, 1),
                                                      size: 16,
                                                      weight: FontWeight.normal,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.clip,
                                                      fontFamily: 'Sen',
                                                    ),
                                                    Image.asset(
                                                      modifier,
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned.fill(
                          top: height * 0.30,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: isTablet ? 32.0 : 20.0,
                              vertical: 20.0,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TitleText(
                                    data: "Nom complet",
                                    color: Colors.black,
                                    size: 16,
                                    weight: FontWeight.normal,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Inter',
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    color: Colors.white,
                                    height: 50,
                                    child: TextField(
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        hintText: '${memberResponse.prenom} ${memberResponse.nom}',
                                        labelStyle: const TextStyle(color: Colors.black38),
                                        fillColor: Colors.white,
                                        focusColor: Colors.white10,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(width: 3.0),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(profilIcon),
                                        ),
                                      ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TitleText(
                                    data: "Adresse",
                                    color: Colors.black,
                                    size: 16,
                                    weight: FontWeight.normal,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Inter',
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    color: Colors.white,
                                    height: 50,
                                    child: TextField(
                                      readOnly: true,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        hintText: '${memberResponse.adresse}',
                                        labelStyle: const TextStyle(color: Colors.black38),
                                        fillColor: Colors.white,
                                        focusColor: Colors.white10,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(width: 3.0),
                                        ),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(locationIcon),
                                        ),
                                      ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  TitleText(
                                    data: "Téléphone",
                                    color: Colors.black,
                                    size: 16,
                                    weight: FontWeight.normal,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Inter',
                                  ),
                                  SizedBox(height: 5),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        color: Colors.white,
                                        child: InternationalPhoneNumberInput(
                                          onInputChanged: (PhoneNumber number) {
                                            /* phoneNumber = number.phoneNumber!;*/
                                          },
                                          onInputValidated: (bool value) {
                                            isValidNumber = value;
                                          },
                                          initialValue: number,
                                          textFieldController: phoneController,
                                          inputDecoration: InputDecoration(
                                            hintText: '${memberResponse.telephone}',
                                            labelStyle: const TextStyle(color: Colors.black38),
                                            fillColor: Colors.white,
                                            focusColor: Colors.white10,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: const BorderSide(width: 3.0),
                                            ),
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(phoneIcon),
                                            ),
                                          ),
                                          selectorConfig: const SelectorConfig(
                                            selectorType: PhoneInputSelectorType.DROPDOWN,
                                          ),
                                          ignoreBlank: false,
                                          autoValidateMode: AutovalidateMode.onUserInteraction,
                                          selectorTextStyle: const TextStyle(color: Colors.black),
                                          formatInput: false,
                                          maxLength: 9,
                                          keyboardType: const TextInputType.numberWithOptions(
                                              signed: true, decimal: true),
                                          cursorColor: Colors.black,
                                        ),
                                      ),
                                      Visibility(
                                        visible: isPressed,
                                        child: Container(
                                          padding: EdgeInsets.only(top: 10),
                                          child: isValidNumber
                                              ? TitleText(
                                                  data: "Numéro Valide",
                                                  color: AppColors.yellow,
                                                  size: 16,
                                                  weight: FontWeight.normal,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                  fontFamily: 'Inter',
                                                )
                                              : TitleText(
                                                  data: "Numéro Invalide",
                                                  color: Colors.red,
                                                  size: 16,
                                                  weight: FontWeight.normal,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.clip,
                                                  fontFamily: 'Inter',
                                                ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
