import 'package:flutter/material.dart';
import 'package:aqar_map/packages/component_library/lib/component_library.dart';

class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({
    this.onTryAgain,
    this.buttonText,
    this.buttonIcon,
    this.padding,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onTryAgain;
  final String? buttonText;
  final IconData? buttonIcon;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 48,
            ),
            const SizedBox(
              height: Spacing.large,
            ),
            const Text(
              'Something went wrong',
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: FontSize.mediumLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: Spacing.medium,
            ),
            const Text(
              'Maybe you are not connected to the internet.\nPlease, check your internet connection and try again later',
              textAlign: TextAlign.center,
            ),
            if (onTryAgain != null)
              const SizedBox(
                height: Spacing.medium,
              ),
            if (onTryAgain != null)
              ExpandedElevatedButton(
                onTap: onTryAgain,
                icon: Icon(
                  buttonIcon ?? Icons.refresh,
                ),
                label: Text(
                  buttonText ?? 'Try Again',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
