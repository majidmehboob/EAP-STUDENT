import 'package:flutter/material.dart';

import '../widgets/scaffold_second.dart';
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleCentr: "Support",
        mainBody:Column(
          children: [
            Text("Support")
          ],
        ),
    );
  }
}
