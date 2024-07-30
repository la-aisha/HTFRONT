import 'package:flutter/material.dart';
import 'package:hizboufront/src/core/global/colors.dart';
import 'package:hizboufront/src/core/providers/bottomnav_provider.dart';
import 'package:hizboufront/src/ui/constantes/index.dart';
import 'package:provider/provider.dart';
import 'package:hizboufront/src/ui/screens/home/home.dart';
import 'package:hizboufront/src/ui/screens/cotisation/cotisation.dart';
import 'package:hizboufront/src/ui/screens/profile/profile.dart';
import 'package:hizboufront/src/core/model/navbar/navbar.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  late List<NavBar> items;

  @override
  void initState() {
    super.initState();
    items = getItems(context);
  }

  List<NavBar> getItems(BuildContext context) {
    return [
      NavBar(
        label: "Accueil",
        imagePath: homeInactif,
        selectedImagePath: homeActif,
        page: Home(),
        onPressed: (context) {
          Provider.of<SelectedIndexModelProvider>(context, listen: false)
              .setCurrentIndex(0);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        },
        imageWidth: 30.0,
        imageHeight: 30,
      ),
      NavBar(
        label: "Cotisation",
        imagePath: cotisationInactif,
        selectedImagePath: cotisationActif,
        page: Cotisation(),
        onPressed: (context) {
          Provider.of<SelectedIndexModelProvider>(context, listen: false)
              .setCurrentIndex(1);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cotisation(),
            ),
          );
        },
        imageWidth: 30.0,
        imageHeight: 30,
      ),
      NavBar(
        label: "Profil",
        imagePath: profilInactif,
        selectedImagePath: profilActif,
        page: Profile(),
        onPressed: (context) {
          Provider.of<SelectedIndexModelProvider>(context, listen: false)
              .setCurrentIndex(2);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Profile(),
            ),
          );
        },
        imageWidth: 30.0,
        imageHeight: 30,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var selectedIndexModel = Provider.of<SelectedIndexModelProvider>(context);

    return BottomNavigationBar(
      backgroundColor: AppColors.yellow,
      currentIndex: selectedIndexModel.currentIndex,
      items: items.map((i) => i.item).toList(),
      onTap: (index) {
        items[index].onPressed(context);
      },
      elevation: 0,
      iconSize: 30, // Adjust icon size if needed
      selectedItemColor: AppColors.green1,
      unselectedItemColor: AppColors.green1,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: 'Inter',
        color: Colors.deepPurple,
      ),
    );
  }
}
