import 'package:flutter/material.dart';

void showAnimatedDialog(BuildContext context, Widget dialog) {
  showGeneralDialog(
    // barrierColor: Colors.red,
    barrierLabel: '',
    barrierDismissible: true,
    context: context,
    pageBuilder: (context, a1, a2) {
      return Container();
    },
    transitionBuilder: (context, a1, a2, widget) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
          child: dialog,
        ),
      );
    },
  );
}
