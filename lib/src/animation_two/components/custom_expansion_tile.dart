import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final bool isExpanded;
  final void Function() onTap;
  final String title;
  final Widget child;
  const CustomExpansionTile({
    Key? key,
    this.isExpanded = false,
    required this.onTap,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          selected: isExpanded,
          onTap: onTap,
          title: Text(title),
          trailing: AnimatedRotation(
            duration: const Duration(milliseconds: 100),
            turns: isExpanded ? 0 : 0.5,
            child: const Icon(Icons.expand_more),
          ),
        ),
        ClipRect(
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 100),
            alignment: Alignment.center,
            heightFactor: isExpanded ? 1 : 0,
            child: child,
          ),
        ),
      ],
    );
    ;
  }
}
