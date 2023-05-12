import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'form_registro.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          usuarioFoto(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    picker.pickImage(source: ImageSource.gallery);
                  },
                  icon: const Icon(
                    Icons.photo,
                    color: Colors.grey,
                  )),
              IconButton(
                  onPressed: () {
                    picker.pickImage(source: ImageSource.camera);
                  },
                  icon: const Icon(
                    Icons.photo_camera,
                    color: Colors.grey,
                  ))
            ],
          ),
          const FormRegistro(),
        ],
      ),
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  usuarioFoto() {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
          border: Border.all(color: Colors.grey, width: 2)),
      child: Icon(
        Icons.person,
        size: 80,
        color: Colors.grey[800],
        shadows: kElevationToShadow[1],
      ),
    );
  }
}
