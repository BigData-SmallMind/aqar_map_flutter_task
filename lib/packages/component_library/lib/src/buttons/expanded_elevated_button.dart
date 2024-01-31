import 'package:flutter/material.dart';

class ExpandedElevatedButton extends StatelessWidget {
  static const double _elevatedButtonHeight = 48;

  const ExpandedElevatedButton({
    required this.label,
    this.onTap,
    this.icon,
    Key? key,
  }) : super(key: key);

  ExpandedElevatedButton.inProgress({
    required String label,
    Key? key,
  }) : this(
          label: Text(label),
          icon: Transform.scale(
            scale: 0.5,
            child: const CircularProgressIndicator(),
          ),
          key: key,
        );

  final VoidCallback? onTap;
  final Widget label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    return SizedBox(
      height: _elevatedButtonHeight,
      width: double.infinity,
      child: icon != null
          ? ElevatedButton.icon(
              onPressed: onTap,
              label: label,
              icon: icon,
            )
          : ElevatedButton(
              onPressed: onTap,
              child: label,
            ),
    );
  }
}

ButtonStyle buildButtonStyle({required Color color}) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all(color),
    textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 17)));
