import 'package:day03/settings.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF7F2F9),
        // color: Colors.red,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Header",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Sub Header",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const Icon(Icons.more_vert),
              ],
            ),
          ),
          Image.asset(
            'assets/scene.jpeg',
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Title",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Sub Header",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                    "Lorem ipusm dolor sit amet consecteture aiolisconng ekit, sed do euisdo temoor"),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                          const Color(0xff6750A4),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()),
                        );
                      },
                      child: const Text("Enabled"),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        foregroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blue;
                            } else {
                              return Colors.white;
                            }
                          },
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xff6750A4),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Enabled"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
