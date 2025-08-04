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
    if (children.isEmpty) return const SizedBox.shrink();

    final rows = <Widget>[];
    for (int i = 0; i < children.length; i += 2) {
      final hasSecond = i + 1 < children.length;
      rows.add(
        Padding(
          padding: EdgeInsets.only(top: i == 0 ? 0 : 20),
          child: Row(
            children: [
              Expanded(child: children[i]),
              const SizedBox(width: 16),
              Expanded(
                child: hasSecond ? children[i + 1] : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
    }

    return Column(children: rows);
  }
}
