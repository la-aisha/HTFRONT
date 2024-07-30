
import 'package:flutter/cupertino.dart';

const String appName = 'Book_Yonn_Mobile';
const String appNameMin1 = 'Book_Yonn';
const String appNameMin2 = 'Mobile';
const String appCurrencySuffix = 'F cfa';
const String appSupportMail = 'support-kaabu@orange-sonatel.com';
const int msisdnMinLength = 9;
//const String appCurrencySuffix = 'F cfa';

const String charsetUtf8 = 'UTF-8';
const String contentTypeJson = 'application/json';
const String contentTypeForm = 'multipart/form-data';
final RegExp replaceAlphaNumericCharacters = RegExp(r'[^\w\s]+');
final RegExp validAlphabeticCharacters = RegExp(r'^[a-zA-Z]+$');
final RegExp validAlphaNumericCharacters = RegExp(r'^[a-zA-Z0-9]+$');
final RegExp validNumericCharacters = RegExp(r'^[0-9]+$');
const List<String> msisdnPrefixes = <String>[
  '70',
  '75',
  '76',
  '77',
  '78',
  '79', // TODO Remove later
];

/// Represents an empty list of items.
/*Widget emptyListWidget = const Text(
  'Aucune donnée à afficher',
  style: TextStyle(
    color: appColorRed,
    fontSize: appFontSizeLg,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  ),
);

/// Represents an empty page.
Widget emptyPage = Container(
  decoration: const BoxDecoration(
    color: appColorGreyLight,
  ),
);

/// Represents an empty Form Recap Step page.
Widget emptyRecapPage = const Text(
  'Aucune donnée à afficher!',
  style: TextStyle(
    color: appColorRed,
    fontSize: appFontSizeMd,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  ),
);*/

/// Represents an empty widget.
Widget emptyWidget = const SizedBox.shrink();
