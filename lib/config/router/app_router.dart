import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
    // initialLocation nos puede servir para definir la pagina que queremos que inicie la arrancar nuestra aplicacion mas que nada para hacer pruebas
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/buttons',
        builder: (context, state) => const ButtonsScreen(),
      ),
      GoRoute(
        path: '/cards',
        builder: (context, state) => const CardsScreen(),
      ),
    ]);
