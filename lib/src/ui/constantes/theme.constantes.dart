import 'package:flutter/material.dart';

enum SizeType { xs, sm, md, lg, xl, xxl }

/// The application's global theme constants / values.
///
/// Holds everything related th the theming as colors, styles, paddings,
/// margins, assets, paths, buttons etc...
const Color appColorBlack = Color(0xff000000);
const Color appColorBlackLight = Color(0xff333333);
const Color appColorBlue = Color(0xff527edb);
const Color appColorBlueLight = Color(0xff4bb4e6);
const Color appColorGreen = Color(0xff32c832);
const Color appColorGrey = Color(0xffd8d8d8);
const Color appColorGreyDark = Color(0xff999999);
const Color appColorGreyDark2 = Color(0xff979797);
const Color appColorGreyDarker = Color(0xff4a4a4a);
const Color appColorGreyLight = Color(0xffd0d2d3);
const Color appColorGreyLighter = Color(0xffeeeeee);
const Color appColorOrange = Color(0xffff7900);
const Color appColorOrangeDark = Color(0xfff16e00);
const Color appColorPink = Colors.pink;
const Color appColorPurple = Color(0xffa885d8);
const Color appColorRed = Color(0xffcd3c14);
const Color appColorWhite = Color(0xffffffff);
const Color appColorYellow = Color(0xffffcc00);

// Operations
const double iconBackgroundColorOpacity = 0.1;
const double iconOperationHomeHeight = 100;
const double iconOperationHomeWidth = 100;
// Operations Colors - Mobile
const Color appColorServiceIdentification = appColorRed;
const Color appColorServiceAbonnement = appColorBlue;
const Color appColorServiceSimSwap = appColorPurple;
const Color appColorServiceCessionLigne = appColorGreen;
const Color appColorServiceTerminaux = appColorBlackLight;
// Operations Colors - Fixe
const Color appColorServiceOvto = appColorGreyDarker;
// Operations Colors - OM
const Color appColorServiceAppliDistri = appColorOrange;
const Color appColorServiceSouscriptionOM = appColorPink;

// Modal Bottom Sheet
const Color appColorModalBackground = Color(0xFF737373);
const double modalBottomSheetHeightSm = 150;
const double modalBottomSheetHeightMd = 200;

// Material Color Swatch
MaterialColor appMaterialColorOrange = MaterialColor(
  appColorOrange.value,
  <int, Color>{
    50: const Color(0xFFFFF3E0),
    100: const Color(0xFFFFE0B2),
    200: const Color(0xFFFFCC80),
    300: const Color(0xFFFFB74D),
    400: const Color(0xFFFFA726),
    500: Color(appColorOrange.value),
    600: const Color(0xFFFB8C00),
    700: const Color(0xFFF57C00),
    800: const Color(0xFFEF6C00),
    900: const Color(0xFFE65100),
  },
);

// Icon Assets
// home
const String cotisationAnnuelle = 'images/home/annuel.png'  ;
const String cotisation = 'images/home/cotisation.png';
const String cotisationMensuelle = 'images/home/mensuelcotisation.png';
const String profilePicture = 'images/home/me.png';
const String totalCotisation = 'images/home/totalcotisation.png';
const String successImage = 'images/home/success.png';
const String homeImage = 'images/home/homeimage.png';
const String cardhome = 'images/home/cardcotisation.png';


//cm home
const String affiche1 = 'images/home/r1.png';
const String affiche2 = 'images/home/r2.png';
const String affiche3 = 'images/home/r3.png';
const String errorIcon = 'images/home/error.png';





//bottom nav
const String homeActif = 'images/bottomnav/home2.png';
const String homeInactif = 'images/bottomnav/home.png';
const String cotisationActif = 'images/bottomnav/cotisation2.png';
const String cotisationInactif = 'images/bottomnav/cotisation.png';
const String profilActif = 'images/bottomnav/profil2.png';
const String profilInactif = 'images/bottomnav/profil.png';





const String iconPathComptePrincipal = 'assets/icons/compte_principal.svg';
const String iconPathDashboard = 'assets/icons/dashboard.svg';
const String iconPathLogoOMMini = 'assets/icons/logo_orange_money_min.svg';
const String iconPathOperationIdentificationOm =
    'assets/icons/operation_identification_om.svg';
const String iconPathOperationIdentificationTelco =
    'assets/icons/operation_identification_telco.svg';
const String iconPathOperationNouvelAbonnement =
    'assets/icons/operation_nouvel_abonnement.svg';
const String iconPathOperationPostPaid = 'assets/icons/operation_postpaid.svg';
const String iconPathOperationPrePaid = 'assets/icons/operation_prepaid.svg';
const String iconPathOperationSouscriptionOm = 'assets/theme/logo-om-min.svg';
const String iconPathOperationSimSwap = 'assets/icons/operation_sim_swap.svg';
const String iconPathOperationTransfertOm =
    'assets/icons/operation_transfert_om.svg';
const String iconPathOperationCessionLigne =
    'assets/icons/operation_vente_sim.svg';
const String iconPathOperationVenteTerminaux =
    'assets/icons/operation_vente_terminaux.svg';
const String iconPathPhoto = 'assets/icons/photo.svg';

// Theme Assets
const String iconPathLogoKaabu = 'assets/theme/logo-kaabu.svg';
const String iconPathLogoSonatel = 'assets/theme/logo-sonatel.svg';
const String iconPathMenuBlack = 'assets/theme/menu-black.svg';
const String iconPathMenuWhite = 'assets/theme/menu-white.svg';
const IconData iconDemandeMobileNa = Icons.sim_card_rounded;
const IconData iconDemandeMobileIdentification = Icons.masks;
const IconData iconDemandeMobileSimSwap = Icons.sync_rounded;
const IconData iconDemandeMobileCessionLigne = Icons.add_ic_call_outlined;

// Image Assets
const String imagePathLogoMini = 'assets/images/logo_orange_min.png';

// Layouts
const double appDefaultMarginXs = 2;
const double appDefaultMarginSm = 5;
const double appDefaultMarginMd = 10;
const double appDefaultMarginLg = 20;
const double appDefaultMarginXl = 30;
const double appDefaultPaddingXs = 5;
const double appDefaultPaddingSm = 10;
const double appDefaultPaddingMd = 15;
const double appDefaultPaddingLg = 25;
const double appDefaultPaddingXl = 30;
const double appDefaultPaddingXXl = 40;
const double appDefaultPaddingXXXl = 60;
const double appCircularRadiusXXs = 3;
const double appCircularRadiusXs = 6;
const double appCircularRadiusSm = 10;
const double appCircularRadiusMd = 15;
const double appCircularRadiusLg = 18;
const double appCircularRadiusXl = 25;
const double appFontSizeXXXl = 33;
const double appFontSizeXXl = 28;
const double appFontSizeXl = 23;
const double appFontSizeLg2 = 20;
const double appFontSizeLg = 18;
const double appFontSizeMd = 16;
const double appFontSizeSm = 13;
const double appFontSizeXs = 11;
const double appFontSizeXXs = 8;
const double appIconSizeMd = 25;
const double appIconSizeLg = 30;
const double appIconSizeXL = 35;
const double appIconSizeXXL = 50;
const double appIconSizeSm = 10;
const double appBorderSm = 3;
const double appBorderMd = 5;
const double appButtonSizeSm = 40;
const double appButtonSizeMd = 50;
const double appButtonSizeLg = 60;

// Screen Size Breakpoints
const double screenSizeHeightMd = 700;

// Drawer
const TextStyle drawerHeaderTextStyle = TextStyle(
  color: appColorWhite,
  fontSize: appFontSizeXl,
  fontWeight: FontWeight.w700,
);

const TextStyle drawerItemsTextStyle = TextStyle(
  color: appColorBlack,
  fontSize: appFontSizeLg,
  fontWeight: FontWeight.w600,
);

const TextStyle drawerFooterTextStyle = TextStyle(
  color: appColorBlack,
  fontSize: appFontSizeXs,
  fontWeight: FontWeight.w500,
);

// Gradient
BoxDecoration appHomeGradientBoxDecoration = const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      appColorBlack,
      appColorOrange,
    ],
    stops: <double>[0.01, 0.7],
  ),
);

BoxDecoration appDrawerGradientBoxDecoration = const BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[
      appColorBlack,
      appColorOrange,
    ],
    stops: <double>[0.01, 0.4],
  ),
);

// Synchronisarion Paramètres
EdgeInsetsGeometry synchronisationPadding = const EdgeInsets.only(
  left: appDefaultPaddingMd,
  right: appDefaultPaddingMd,
  bottom: appDefaultPaddingMd,
);

// Authentication
const double appIconLogoKaabuHeight = 60;
const double appIconLogoSonatelHeight = 30;

// Stepper
const double stepperFontSizeTitle = 18;
const double stepperFontSizeStep = 15;
const double stepperFontSizeStepSelected = 17;

// Form Layout
const double appFormItemsSpacing = 10;
const double appFormButtonPressedOpacity = 0.5;
const double appButtonOpacity = 0.1;
const double appFormFieldHeightSm = 40;
const double appFormFieldHeightMd = 45;
const double appFormFieldHeightLg = 70;

const InputBorder formFieldError = OutlineInputBorder(
  borderSide: BorderSide(
    color: appColorRed,
    width: appBorderSm,
  ),
  borderRadius: BorderRadius.all(
    Radius.circular(
      appCircularRadiusSm,
    ),
  ),
);

/// Get the checkbox color.
Color getCheckboxColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return appColorOrange;
  }
  return appColorBlack;
}

InputDecoration getFormFieldInputDecoration({
  FocusNode? focusNode,
  bool enabled = false,
  required String labelText,
  String? hintText,
  String? helperText,
  IconData? iconData,
  IconData? iconDataSuffix,
  VoidCallback? iconDataSuffixOnPressed,
  bool iconDataSuffixFilled = false,
  String? errorText,
  TextInputType keyboardType = TextInputType.text,
  required Function(String) onChanged,
}) {
  return InputDecoration(
    enabled: enabled,
    labelText: labelText,
    labelStyle: TextStyle(
      color: (focusNode != null && focusNode.hasFocus)
          ? appColorGreyDarker
          : appColorGreyDark,
      fontSize: (focusNode != null && focusNode.hasFocus)
          ? appFontSizeLg
          : appFontSizeMd,
      fontWeight: FontWeight.w400,
    ),
    hintText: hintText,
    hintStyle: const TextStyle(
      color: appColorGreyDark,
      fontSize: appFontSizeMd,
      fontWeight: FontWeight.w400,
    ),
    helperText: helperText,
    filled: true,
    fillColor: enabled ? appColorWhite : appColorGreyLighter,
    icon: (iconData != null)
        ? Icon(
            iconData,
            color: appColorOrange,
          )
        : null,
    suffixIcon: (iconDataSuffix != null)
        // TODO fill suffix icon height to the TextFormField height
        ? (iconDataSuffixFilled
            ? DecoratedBox(
                decoration: const BoxDecoration(
                  color: appColorBlack,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(appCircularRadiusSm),
                    bottomRight: Radius.circular(appCircularRadiusSm),
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    iconDataSuffix,
                    color: appColorWhite,
                  ),
                  color: appColorBlack,
                  onPressed: () {
                    if (iconDataSuffixOnPressed != null) {
                      iconDataSuffixOnPressed.call();
                    }
                  },
                ),
              )
            : IconButton(
                icon: Icon(iconDataSuffix),
                color: (focusNode != null && focusNode.hasFocus)
                    ? appColorBlack
                    : appColorGreyDark,
                iconSize: appIconSizeXL,
                onPressed: () {
                  if (iconDataSuffixOnPressed != null) {
                    iconDataSuffixOnPressed.call();
                  }
                },
              ))
        : null,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: appBorderSm,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          appCircularRadiusSm,
        ),
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: appColorGreyLighter,
        width: appBorderSm,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          appCircularRadiusSm,
        ),
      ),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: appColorGreyLight,
        width: appBorderSm,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          appCircularRadiusSm,
        ),
      ),
    ),
    errorText: errorText,
    errorBorder: formFieldError,
    focusedErrorBorder: formFieldError,
    errorStyle: const TextStyle(
      color: appColorRed,
      fontSize: appFontSizeXs,
      fontStyle: FontStyle.italic,
    ),
  );
}

// Dialogs
const TextStyle dialogHeaderTextStyle = TextStyle(
  color: appColorBlack,
  fontSize: appFontSizeMd,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
);

// Demandes
const TextStyle formDialogActionOkTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
);

const TextStyle formDialogActionDefaultTextStyle = TextStyle(
  color: appColorBlack,
  fontWeight: FontWeight.bold,
);

// Historique
const TextStyle historiqueDateTextStyle = TextStyle(
  color: appColorBlack,
  fontSize: appFontSizeXs,
);
