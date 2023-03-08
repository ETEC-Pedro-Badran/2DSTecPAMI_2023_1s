import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            title: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    color: Colors.white24, shape: BoxShape.circle),
                child: Icon(Icons.person_outline)),
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.visibility_outlined)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.help_outline_outlined))
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 18.0, bottom: 18),
                      child: Text(
                        "Prof. Evaldo",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Conta PJ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 20,
                color: Colors.black54,
              ),
            ],
          ),
        ));
  }
}
