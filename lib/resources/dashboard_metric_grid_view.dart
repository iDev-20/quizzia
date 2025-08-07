import 'package:flutter/material.dart';

class DashboardMetricGridView extends StatelessWidget {
  const DashboardMetricGridView({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 20,
      children: children,
    );
  }
}
