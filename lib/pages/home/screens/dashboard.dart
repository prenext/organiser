import 'package:flutter/material.dart';

import '../../../widgets/progress_card.dart';
import '../../../widgets/progress_span_chips.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(
          children: [
            progress_span_chips(),
            progress_card()
          ],
        ),
      ),
    );
  }
}
