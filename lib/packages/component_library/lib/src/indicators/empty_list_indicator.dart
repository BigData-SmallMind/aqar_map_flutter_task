import 'package:flutter/material.dart';
import 'package:aqar_map/packages/component_library/lib/component_library.dart';

class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({
    required this.title,
    required this.message,
    this.padding,
    this.margin,
    Key? key,
  }) : super(key: key);
  final String title;
  final String message;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: padding,
      margin: margin,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: Spacing.large,
              ),
              Text(
                'The list is empty',
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: Spacing.large,
              ),
              const Text('There are no listings matching your filters')
            ]),
      ),
    );
  }
}
