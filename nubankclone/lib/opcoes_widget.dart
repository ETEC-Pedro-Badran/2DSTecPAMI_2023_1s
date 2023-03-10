import 'package:flutter/material.dart';

class OpcaoWidget extends StatelessWidget {
  final IconData icon;
  final String rotulo;

  const OpcaoWidget({super.key, required this.icon, required this.rotulo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(10),
            decoration:
                BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
            child: Icon(icon)),
        const SizedBox(
          height: 10,
        ),
        Text(
          rotulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
