import 'package:flutter/material.dart';

const String dateFormatEn = 'yyyy-MM-dd';
const String dateFormatFr = 'dd/MM/yyyy';
const String timeFormatFr = 'HH:mm';
const String dateTimeFormatEn = 'yyyy-MM-dd HH:mm:ss';
const String dateTimeFormatFr = 'dd/MM/yyyy HH:mm:ss';
const String dateTimeFormat1 = 'yyyy-MM-dd HH:mm:ssZ';
const String dateTimeFormat2 = "yyyy-MM-dd'T'HH:mm:ssZ";

/// The app's used date formats.
List<String> dateFormats = <String>[
  dateFormatEn,
  dateFormatFr,
  dateTimeFormatEn,
  dateTimeFormatFr,
  dateTimeFormat1,
  dateTimeFormat2,
].toList();

/// The 'fr' locale.
Locale appLocaleFr = const Locale('fr', 'FR');
