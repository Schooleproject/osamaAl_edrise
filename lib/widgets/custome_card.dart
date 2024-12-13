
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/helpers/constants.dart';
import 'package:flutter_tutorial/themes/colors.dart';

import '../helpers/painters.dart';
import '../themes/styles.dart';

class CustomCard extends StatelessWidget {

final Widget child;
  const CustomCard({Key? key,required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopAndBottomWaveClipper(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin:EdgeInsets.all(defaultMargin),
        height: MediaQuery.of(context).size.height/2,
        decoration:ThemeDecorations.gradientBox(context),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: child
        ),
      ),
    );
  }
}

