// import 'package:flutter/material.dart';

// class DashboardMetricGridView extends StatelessWidget {
//   const DashboardMetricGridView({super.key, required this.children});

//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: children.isNotEmpty,
//       child: Column(
//         children: [
//           Row(
//             children: [
//               getWidgetAtIndex(0),
//               horizontalSpacer(),
//               getWidgetAtIndex(1),
//             ],
//           ),
//           Visibility(
//             visible: indexIsAvailable(2),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Row(
//                 children: [
//                   getWidgetAtIndex(2),
//                   horizontalSpacer(),
//                   getWidgetAtIndex(3),
//                 ],
//               ),
//             ),
//           ),
//           Visibility(
//             visible: indexIsAvailable(2),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Row(
//                 children: [
//                   getWidgetAtIndex(4),
//                   horizontalSpacer(),
//                   getWidgetAtIndex(5),
//                 ],
//               ),
//             ),
//           ),
//           Visibility(
//             visible: indexIsAvailable(2),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: Row(
//                 children: [
//                   getWidgetAtIndex(6),
//                   horizontalSpacer(),
//                   getWidgetAtIndex(7),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget horizontalSpacer() {
//     return const SizedBox(width: 16);
//   }

//   bool indexIsAvailable(int index) {
//     return index < children.length;
//   }

//   Widget getWidgetAtIndex(int index) {
//     return Expanded(
//       child:
//           indexIsAvailable(index) ? children[index] : const SizedBox.shrink(),
//     );
//   }
// }

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
