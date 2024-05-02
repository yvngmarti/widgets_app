import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // esta variable nos va permitir saber cual opcion del drawer esta seleccionada y en la cual podemos aplicar estilos especificos basados en la seleccionada
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      // para tocar las diferentes opciones y cambie cual esta seleccionado
      selectedIndex: null,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);

        // con esto hacemos referencia a nuestro scaffold del home de tal manera que cuando entremos a una opcion y despues nos queramos salir de esa pantalla pues nos cierre el drawer y nos deje solo con el scaffold padre
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            30,
            // notch es el borde que tienen algunos celulares en la parte de la camara frontal
            hasNotch ? 0 : 20,
            20,
            10,
          ),
          child: const Text('Opciones primarias'),
        ),
        ...appMenuItems
            // con esto obtenemos los primeros tres elementos de nuestra lista del elemento 0 al 3
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.iconData),
                label: Text(item.titLe),
              ),
            ),

        const Padding(
          padding: EdgeInsets.fromLTRB(18, 16, 18, 10),
          // divider es un widget de flutter que crea una linea divisora
          child: Divider(),
        ),
        // const NavigationDrawerDestination(
        //     icon: Icon(Icons.dangerous), label: Text('Otra pantalla'))

        const Padding(
          padding: EdgeInsets.fromLTRB(
            30,
            10,
            20,
            10,
          ),
          child: Text('Opciones secundarias'),
        ),
        ...appMenuItems
            // con esto obtenemos los primeros tres elementos de nuestra lista del elemento 0 al 3
            .sublist(3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.iconData),
                label: Text(item.titLe),
              ),
            ),
      ],
    );
  }
}
