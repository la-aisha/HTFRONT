import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/core/methods/common_methods.dart';
import 'package:hizboufront/src/core/models/response/member_response.dart';
import 'package:hizboufront/src/core/providers/auth_provider.dart';
import 'package:hizboufront/src/ui/constantes/index.dart';
import 'package:hizboufront/utils/bottom_nav_bar.dart';
import 'package:hizboufront/utils/customelevatedbutton.dart';
import 'package:hizboufront/utils/title.dart';
import 'package:hizboufront/utils/titleoption.dart';
import 'package:hizboufront/utils/titre.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CommonMethods commonMethods = CommonMethods();
  late Future<dynamic> getMemberinF;

  Future<MemberResponse> getMemberinFo() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String token = ap.token;
    print('------ Token user $token ---------');
    var result = ap.getMemberinfoProvider(token, context) ;

    // Assuming result is a JSON object
    //result.member;
    print('---------- myprint ${result.toString()}');
    return result;
  }

  cotisationFunction() {
    commonMethods.checkConnectivity(context);
    // registerfournisseurinfo();
    commonMethods.alertDialog(
        context,
        AppColors.green1,
        TitleOption(
            data: 'Message',
            color: AppColors.green1,
            size: 18,
            weight: FontWeight.bold),
        Titre(
          data:
              'impossible de cotiser pour le moment .Ceci sera disponible ulterieurment',
          color: AppColors.green1,
          size: 12,
          weight: FontWeight.w600,
        ),
        AssetImage(
          errorIcon,
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMemberinF = getMemberinFo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isTablet = width > 600;

    //print('--------- memberinfo ${getMemberinF}');

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.yellow,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: height * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          homeImage), // Replace 'homeImage' with your image path
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TitleOption(
                            data: 'Bonjour Mamadou',
                            color: AppColors.green1,
                            size: 20,
                            weight: FontWeight.normal,
                          ),
                          Image.asset(
                              profilePicture) // Replace 'profilePicture' with your image path
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage(
                                    cardhome), // Replace 'cardhome' with your image path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    cotisation, // Replace 'cotisation' with your image path
                                    height: 120,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TitleText(
                                          data: 'Mois janvier',
                                          color: Colors.white,
                                          size: 12,
                                          weight: FontWeight.normal,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Inter',
                                        ),
                                        const SizedBox(height: 5),
                                        TitleText(
                                          data: 'Cotisation Mensuelle',
                                          color: Colors.white,
                                          size: 18,
                                          weight: FontWeight.bold,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: 'Inter',
                                        ),
                                        const SizedBox(height: 5),
                                        Container(
                                          height: 60,
                                          child: TitleText(
                                            data:
                                                'En tant que membre de Hizbu Tarkhiya, votre cotisation mensuelle est essentielle pour nous.',
                                            color: Colors.white,
                                            size: 11,
                                            weight: FontWeight.normal,
                                            maxLines: 4,
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: 'Inter',
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: CustomElevatedButton(
                                            backgroundColor: AppColors.yellow,
                                            borderColor: AppColors.yellow,
                                            borderRadius: 8,
                                            width: 100,
                                            height: 30,
                                            onPressed: () {
                                              cotisationFunction();
                                            },
                                            titleText: TitleText(
                                              data: 'cotisez.',
                                              color: AppColors.green1,
                                              size: 11,
                                              weight: FontWeight.normal,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: 'Inter',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  top: height * 0.35,
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
                          Titre(
                            data: 'Statistiques ',
                            color: AppColors.green1,
                            size: 20,
                            weight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.greenContainer,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(cotisationMensuelle),
                                      Titre(
                                        data: '920',
                                        color: Colors.white,
                                        size: 20,
                                        weight: FontWeight.w600,
                                      ),
                                      Titre(
                                        data: 'mensuelle',
                                        color: Colors.white,
                                        size: 10,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.greenContainer,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(cotisationAnnuelle),
                                      Titre(
                                        data: '920',
                                        color: Colors.white,
                                        size: 20,
                                        weight: FontWeight.w600,
                                      ),
                                      Titre(
                                        data: 'annuelle',
                                        color: Colors.white,
                                        size: 10,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 100,
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: AppColors.greenContainer,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(totalCotisation),
                                      Titre(
                                        data: '920',
                                        color: Colors.white,
                                        size: 20,
                                        weight: FontWeight.w600,
                                      ),
                                      Titre(
                                        data: 'total',
                                        color: Colors.white,
                                        size: 10,
                                        weight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Titre(
                            data: 'Evenements recents',
                            color: AppColors.green1,
                            size: 20,
                            weight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(affiche1),
                                      fit: BoxFit.fitWidth,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  width: 150,
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(affiche2),
                                      fit: BoxFit.fitWidth,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                Container(
                                  height: 150,
                                  width: 150,
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(affiche3),
                                      fit: BoxFit.fitWidth,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Titre(
                            data: 'Versements recents',
                            color: AppColors.green1,
                            size: 20,
                            weight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TabBar(
                            labelColor: AppColors.green1,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: AppColors.green1,
                            //labelStyle: TextStyle(height: 13 ,color: AppColors.green1 ,fontSize: 15),
                            tabs: [
                              Tab(text: 'mensuelle'),
                              Tab(text: 'autres'),
                            ],
                          ),
                          SizedBox(
                            height: 200, // Adjust height as needed
                            child: TabBarView(
                              children: [
                                Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: AppColors.green1)),
                                    child: Center(
                                      child: Titre(
                                        data: 'Pas de versement à date',
                                        color: AppColors.green1,
                                        size: 13,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                        border: Border.all(
                                            color: AppColors.green1)),
                                    child: Center(
                                      child: Titre(
                                        data: 'Pas de versement à date',
                                        color: AppColors.green1,
                                        size: 13,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        /* bottomNavigationBar: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: MyBottomNavBar(),
        ), */
      ),
    );
  }
}
