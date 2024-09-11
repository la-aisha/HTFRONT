import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/core/methods/common_methods.dart';
import 'package:hizboufront/src/core/models/response/member_response.dart';
import 'package:hizboufront/src/core/providers/auth_provider.dart';
import 'package:hizboufront/src/ui/constantes/index.dart';
import 'package:hizboufront/src/ui/screens/home/home.dart';
import 'package:hizboufront/src/ui/screens/login/login.dart';
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
  //final ap = Provider.of<AuthProvider>(context, listen: false);

  Future<MemberResponse?> fetchMemberInfo() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String token = ap.token;
    print('------ Token user $token ---------');
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
    await Future.delayed(const Duration(seconds: 1));
    return 'SN';
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isTablet = width > 600;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(14, 44, 34, 10),
      body: SafeArea(
        child: FutureBuilder<MemberResponse?>(
          future: memberFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show shimmer effect while loading
              return const Center(
                child:    Center(
                  child: LoaderWidget(),
                )
                
                /* Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: height * 0.2,
                        color: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.white,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              */ );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red)),
              ); // Show error message
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text('No data available',
                    style: TextStyle(color: Colors.black)),
              ); // Show no data message
            } else {
              final memberResponse = snapshot.data!;
              return Stack(
                children: [
                 /*  Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Home()),
                                    );
                                  },
                                  child: Image.asset(
                                    'images/back.png',
                                    width: 41,
                                  ),
                                ),] ,),)), */
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          height: height * 0.5,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.yellow,
                                ),
                                width: double.infinity,
                                height: height * 0.2,
                                child: 
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Home()),
                                                );
                                              },
                                              child: Image.asset(
                                                'images/back.png',
                                                width: 41,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                  profilePicture,
                                                  height: 100,
                                                  width: 100,
                                                ),
                                                Column(
                                                  children: [
                                                    TitleOption(
                                                data:
                                                    '${memberResponse.prenom} ${memberResponse.nom}',
                                                color: AppColors.green1,
                                                size: 24,
                                                weight: FontWeight.bold),
                                            TitleText(
                                                data:
                                                    '${memberResponse.matricule}',
                                                color: Colors.green,
                                                size: 16,
                                                weight: FontWeight.normal,
                                                maxLines: 1,
                                                overflow: TextOverflow.clip,
                                                fontFamily: 'Sen'),
                                              ],
                                            ),

                                                  ],
                                                )
                                                
                                          ],
                                        
                                        // Column(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.spaceBetween,
                                        //   crossAxisAlignment:
                                        //       CrossAxisAlignment.start,
                                        //   children: [
                                        //     TitleOption(
                                        //         data:
                                        //             '${memberResponse.prenom} ${memberResponse.nom}',
                                        //         color: AppColors.green1,
                                        //         size: 24,
                                        //         weight: FontWeight.bold),
                                        //     const SizedBox(height: 10),
                                        //     TitleText(
                                        //         data:
                                        //             '${memberResponse.matricule}',
                                        //         color: Colors.green,
                                        //         size: 16,
                                        //         weight: FontWeight.normal,
                                        //         maxLines: 1,
                                        //         overflow: TextOverflow.clip,
                                        //         fontFamily: 'Sen'),
                                        //     const SizedBox(height: 20),
                                        //     /* GestureDetector(
                                        //       onTap: () {},
                                        //       child: Container(
                                        //         width: 200,
                                        //         height: 30,
                                        //         decoration: BoxDecoration(
                                        //             color: Color.fromRGBO(
                                        //                 217, 217, 217, 1),
                                        //             borderRadius:
                                        //                 BorderRadius.circular(
                                        //                     10)),
                                        //         child: Row(
                                        //           mainAxisAlignment:
                                        //               MainAxisAlignment
                                        //                   .spaceAround,
                                        //           children: [
                                        //             TitleText(
                                        //                 data: 'Modifier profil',
                                        //                 color: Color.fromRGBO(
                                        //                     70, 78, 87, 1),
                                        //                 size: 16,
                                        //                 weight:
                                        //                     FontWeight.normal,
                                        //                 maxLines: 1,
                                        //                 overflow:
                                        //                     TextOverflow.clip,
                                        //                 fontFamily: 'Sen'),
                                        //             Image.asset(
                                        //               modifier,
                                        //               height: 10,
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     )
                                        //    */],
                                        // )
                                      
                                  
                                  
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
                                  const SizedBox(height: 5),
                                  Container(
                                    color: Colors.white,
                                    height: 50,
                                    child: TextField(
                                      readOnly: true,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(

                                          hintText:
                                              '${memberResponse.prenom} ${memberResponse.nom}',
                                          labelStyle: const TextStyle(
                                              color: Colors.black38),
                                          fillColor: Colors.white,
                                          focusColor: Colors.white10,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 3.0,
                                            ),
                                          ),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(profilIcon),
                                          )),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TitleText(
                                    data: "Adresse",
                                    color: Colors.black,
                                    size: 16,
                                    weight: FontWeight.normal,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Inter',
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    color: Colors.white,
                                    height: 50,
                                    child: TextField(
                                      readOnly: true,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                          hintText: '${memberResponse.adresse}',
                                          labelStyle: const TextStyle(
                                              color: Colors.black38),
                                          fillColor: Colors.white,
                                          focusColor: Colors.white10,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 3.0,
                                            ),
                                          ),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(locationIcon),
                                          )),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                   const SizedBox(height: 10),
                                  TitleText(
                                    data: "Date de Naissance",
                                    color: Colors.black,
                                    size: 16,
                                    weight: FontWeight.normal,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Inter',
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    color: Colors.white,
                                    height: 50,
                                    child: TextField(
                                      readOnly: true,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                          hintText: '${memberResponse.dateNaissance}',
                                          labelStyle: const TextStyle(
                                              color: Colors.black38),
                                          fillColor: Colors.white,
                                          focusColor: Colors.white10,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 3.0,
                                            ),
                                          ),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(ddnIcon),
                                          )),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TitleText(
                                    data: "Cellule",
                                    color: Colors.black,
                                    size: 16,
                                    weight: FontWeight.normal,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Inter',
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    color: Colors.white,
                                    height: 50,
                                    child: TextField(
                                      readOnly: true,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                          hintText:
                                              '${memberResponse.zone.cellule.libelle}',
                                          labelStyle: const TextStyle(
                                              color: Colors.black38),
                                          fillColor: Colors.white,
                                          focusColor: Colors.white10,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                              width: 3.0,
                                            ),
                                          ),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(ddnIcon),
                                          )),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                  
                                  const SizedBox(height: 10),
                                  TitleText(
                                    data: "Téléphone",
                                    color: Colors.black,
                                    size: 16,
                                    weight: FontWeight.normal,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Inter',
                                  ),
                                  const SizedBox(height: 5),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        color: Colors.white,
                                        child: GestureDetector(
                                          onTap: () {
                                            // Do nothing, making the field effectively read-only
                                          },
                                          child: AbsorbPointer(
                                            absorbing: true,
                                            child: InternationalPhoneNumberInput(
                                              onInputChanged: (PhoneNumber number) {
                                                // Handle input change
                                              },
                                              onInputValidated: (bool value) {
                                                print(value);
                                              },
                                              selectorConfig: const SelectorConfig(
                                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                              ),
                                              ignoreBlank: false,
                                              autoValidateMode: AutovalidateMode.disabled,
                                              selectorTextStyle: const TextStyle(color: Colors.black),
                                              initialValue: number,
                                              textFieldController: phoneController,
                                              formatInput: true,
                                              keyboardType: const TextInputType.numberWithOptions(
                                                  signed: true, decimal: true),
                                              inputBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(color: AppColors.green1),
                                              ),
                                              onSaved: (PhoneNumber number) {
                                                print('On Saved: $number');
                                              },
                                              errorMessage: "invalid_phone",
                                              spaceBetweenSelectorAndTextField: 1,
                                              inputDecoration: InputDecoration(
                                                hintText: "${memberResponse.numeroTel}",
                                                hintStyle: const TextStyle(
                                                    color: Colors.black45, fontWeight: FontWeight.normal),
                                                border: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.green1),
                                                ),
                                                focusedBorder: const OutlineInputBorder(
                                                  borderSide: BorderSide(color: AppColors.green1),
                                                ),
                                              ),
                                              countries: [
                                                "SN", "TN", "CD", "CI", "ML", "GN", "FR", "US"
                                              ],
                                            ),
                                          ),
                                        ),
                                      ) ,

                                      SizedBox(height: 20,),

                                      GestureDetector(
                                        onTap: (){
                                           final ap = Provider.of<AuthProvider>(context, listen: false);
                                            String token = ap.token;
                                          ap.logOutProvider(token, context) ;
                                          Navigator.of(context).pushReplacement(
                                           MaterialPageRoute(builder: (context) => Login()), );
                                        } ,
                                        child: Container(
                                          decoration: BoxDecoration(
                                             color: AppColors.green1,
                                             borderRadius: BorderRadius.circular(10)
                                          ),
                                          width: double.infinity,
                                          height: 60,
                                         
                                          child: Center(
                                            child: TitleText(
                                              data: "deconnexion",
                                              color: Colors.white,
                                              size: 16,
                                              weight: FontWeight.normal,
                                              maxLines: 1,
                                              overflow: TextOverflow.clip,
                                              fontFamily: 'Inter',
                                            ),
                                            
                                          ),


                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
