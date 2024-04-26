import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        // return Text(item.titLe);
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.iconData,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      title: Text(menuItem.titLe),
      subtitle: Text(menuItem.subtitle),
      onTap: () {
// propias de flutter
        // primera forma de implementar las rutas en flutter
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => const ButtonsScreen(),
        // ));

        // segunda forma de implementar las rutas en flutter
        // Navigator.pushNamed(context, menuItem.link);

// propias de go router
        // tercera forma de implementar las rutas en flutter
        context.push(menuItem.link);

        // cuarta forma de implementar las rutas en flutter, esta es cuando ya sabemos el nombre de la ruta el cual esta definido en la clase de la ruta
        // context.pushNamed(CardsScreen.name);
      },
      // splashColor: // cambios las propiedades del splash
    );
  }
}
