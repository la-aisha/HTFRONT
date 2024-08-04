import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hizboufront/src/core/global/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitDoubleBounce(color: AppColors.green1);
  }
}

class LoaderOnTakePicture extends StatelessWidget {
  const LoaderOnTakePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitWaveSpinner(
      color: Theme.of(context).colorScheme.primary,
    );
  }
}

class LoaderOnSubmit extends StatelessWidget {
  const LoaderOnSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitPouringHourGlassRefined(
      color: Colors.white,
    );
  }
}
