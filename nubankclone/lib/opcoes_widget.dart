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
          color: Colors.white,
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.grey[300], shape: BoxShape.circle),
                  child: Icon(icon)),
              const SizedBox(
                height: 10,
              ),
              Text(
                rotulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
