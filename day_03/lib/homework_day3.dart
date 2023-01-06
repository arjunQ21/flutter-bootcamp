import 'package:day03/homework_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CustomCard());
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeWork2(),
      // home: Scaffold(
      //   body: SafeArea(
      //     child: Container(
      //       margin: const EdgeInsets.symmetric(
      //         horizontal: 24,
      //       ),
      //       decoration: BoxDecoration(
      //         color: const Color(0xffF7F2F9),
      //         borderRadius: BorderRadius.circular(24),
      //       ),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           Container(
      //             padding: const EdgeInsets.symmetric(
      //               horizontal: 24,
      //               vertical: 16,
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: const [
      //                     Text(
      //                       "Heading",
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 20,
      //                       ),
      //                     ),
      //                     Text("Subhead"),
      //                   ],
      //                 ),
      //                 Icon(Icons.more_vert),
      //               ],
      //             ),
      //           ),
      //           Image.asset('assets/scene.jpeg'),
      //           Container(
      //             padding: const EdgeInsets.symmetric(
      //               horizontal: 24,
      //               vertical: 16,
      //             ),
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 const Text(
      //                   "Heading",
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 18,
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 8,
      //                 ),
      //                 const Text(
      //                   "Subhead",
      //                   style: TextStyle(
      //                     fontSize: 16,
      //                   ),
      //                 ),
      //                 const SizedBox(
      //                   height: 16,
      //                 ),
      //                 const Text(
      //                   "lorem ipsum sdaf saf saf asf asd fasd fas lorem ipsum sdaf saf saf asf asd fasd fas lor",
      //                 ),
      //                 const SizedBox(
      //                   height: 16,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.end,
      //                   children: [
      //                     OutlinedButton(
      //                       onPressed: () {},
      //                       style: ButtonStyle(
      //                         shape: MaterialStateProperty.all(
      //                           RoundedRectangleBorder(
      //                             borderRadius: BorderRadius.circular(16),
      //                           ),
      //                         ),
      //                         side: MaterialStateProperty.all(
      //                           const BorderSide(
      //                             color: Colors.grey,
      //                           ),
      //                         ),
      //                         foregroundColor: MaterialStateProperty.all(
      //                           const Color(0xff6750A4),
      //                         ),
      //                       ),
      //                       child: const Text("Enabled "),
      //                     ),
      //                     const SizedBox(
      //                       width: 16,
      //                     ),
      //                     ElevatedButton(
      //                       onPressed: () {},
      //                       child: Text("Enabled"),
      //                       style: ButtonStyle(
      //                         shape: MaterialStateProperty.all(
      //                           RoundedRectangleBorder(
      //                             borderRadius: BorderRadius.circular(16),
      //                           ),
      //                         ),
      //                         backgroundColor: MaterialStateProperty.all(
      //                           const Color(0xff6750A4),
      //                         ),
      //                         foregroundColor: MaterialStateProperty.all(
      //                           Colors.white,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
