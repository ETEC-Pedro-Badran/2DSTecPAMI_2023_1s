import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'app_store.dart';
import 'form_registro.dart';
import 'usuario_model.dart';

class PerfilPage extends StatefulWidget {
  final AppStore appStore;
  const PerfilPage({super.key, required this.appStore});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  late Usuario usuario;
  @override
  void initState() {
    super.initState();
    usuario = widget.appStore.identificado!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            usuarioFoto(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      obterFoto(ImageSource.gallery);
                    },
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.grey,
                    )),
                IconButton(
                    onPressed: () async {
                      obterFoto(ImageSource.camera);
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
      ),
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  usuarioFoto() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[300],
          border: Border.all(color: Colors.grey, width: 2)),
      child: usuario.foto?.isNotEmpty ?? false
          ? CircleAvatar(
              radius: 80,
              backgroundImage:
                  Image.file(File(usuario.foto!), fit: BoxFit.contain).image,
            )
          : Icon(
              Icons.person,
              size: 80,
              color: Colors.grey[800],
              shadows: kElevationToShadow[1],
            ),
    );
  }

  Future<void> obterFoto(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    var file = await picker.pickImage(source: source);
    setState(() async {
      usuario.foto = await file?.path ?? null;
    });
  }
}
