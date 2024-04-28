import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Quis veniam ad commodo eiusmod culpa enim. Officia labore duis minim labore. Reprehenderit magna labore sunt elit sint est. Reprehenderit ex dolore id pariatur pariatur pariatur nisi consequat in non consequat minim amet reprehenderit.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar dialogo')),
          ],
        ),
      ),
      floatingActionButton: _showCustomSnackBarMethod(context),
    );
  }

  // metodo que ira dentro del floatingActionButton
  FloatingActionButton _showCustomSnackBarMethod(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => showCustomSnackbar(context),
      label: const Text('Mostrar snackbars'),
      icon: const Icon(Icons.remove_red_eye_outlined),
    );
  }

  // funcion para mostrar los snackbars
  void showCustomSnackbar(BuildContext context) {
    // ocultamos los snackbars anteriores cada ves de un nuevo snackbar
    ScaffoldMessenger.of(context).clearSnackBars();

    // creacion de la instacion para pasarla al ScaffoldMessenger
    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // para llamar nuestro dialogo personalizado
  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text(
            'Incididunt aute ullamco occaecat fugiat dolor est amet reprehenderit culpa. Eiusmod ea exercitation veniam ex excepteur ad deserunt mollit commodo irure commodo nisi est consequat. Nulla adipisicing et tempor nisi nisi ad deserunt fugiat qui ad consequat enim irure culpa. Qui irure sint tempor consequat deserunt.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }
}
