import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hizboufront/utils/titleoption.dart';
import 'package:hizboufront/utils/titre.dart';


class CommonMethods {
 
  //verifier la connection internet
  Future<void> checkConnectivity(BuildContext context) async {
  var connectionResult = await Connectivity().checkConnectivity();
  if (connectionResult != ConnectivityResult.mobile &&
      connectionResult != ConnectivityResult.wifi) {
      // Handle no connectivity case
      if (!context.mounted) return;
      displayAlert(context ,'pas de connection' ,"verifier votre connextion internet");
  } else {
      // Handle connectivity case
  }
  }

  /* show snackbar */
  void displaySnackbar(String messageText, BuildContext context) {
      var snackBar = SnackBar(content: Text(messageText));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


   void showAlertDialog(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  /* Function for alerts */
   Future<void> alertDialog(BuildContext context, Color color, TitleOption text, Titre text2, AssetImage assetImage) async {
  return showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
    return CupertinoAlertDialog(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Image(image: assetImage, height: 70, width: 70),

       /*  Icon(
            CupertinoIcons.exclamationmark_circle,
            color: color,
            size: 30,
        ), */
        const SizedBox(width: 8),
        ],
    ),
    content: Column(
        children: [
        const SizedBox(height: 16),
        Align(alignment: Alignment.center, child: text,),
        const SizedBox(height: 16),
        Align(alignment: Alignment.center, child: text2,),

        ],
    ),
    actions: [
        CupertinoDialogAction(
        child: const Text('OK'),
        onPressed: () {
            Navigator.pop(context);
        },
        ),
    ],
    );
    },
  );
  }

  //alert message pour connection
  void displayAlert(BuildContext context , String text , String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title:  Row(
            children: [
             /*  Icon(
                CupertinoIcons.exclamationmark_circle,
                color: Colors.red,
                size: 30,
              ),
              SizedBox(width: 8), */
              Text(text),
            ],
          ),
          content: Column(
            children: [
              const SizedBox(height: 16),
              /* Image.asset(
                'images/connection.png',
                height: 100,
                width: 100,
              ), */
              const SizedBox(height: 16),
              Text(content),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


void displayAlertSimple(
      BuildContext context, String text, String content, Widget page) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => page,
            ),
          );
        });
        return CupertinoAlertDialog(
          title: Text(text),
          content: Text(content),
         /*  actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ], */
        );
      },
    );
  }

  
  
}