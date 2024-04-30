import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
        // addFiveImages();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    // revisar si esta montado el componente / widget
    if (!isMounted) return;
    setState(() {});

    // mover scroll
    moveScrollToBottom();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((item) => lastId + item));

    // setState(() {});
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isLoading = false;
    // con esto obtenemos el ultimo elemento de la lista
    final lastId = imagesIds.last;
    // ahora con clear borramos todos los elementos del arreglo
    imagesIds.clear();
    imagesIds.add(lastId + 1);

    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {
    if ((scrollController.position.pixels + 150) <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      // tiene que ser una posicion a la cual queremos mover la pocision del scroll, podria decirce que es una unidad en pixeles
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              // return const Text('Hola');

              // el FadeInImage nos permite cargar una imagen y mientras carga la imagen nos muestra el placeholder, y ese placeholder es otra imagen que nosotros ya tenemos para mostrar, esa imagen puede venir de los assets
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: isLoading
          ? FadeIn(
              delay: const Duration(milliseconds: 100),
              child: const CircularProgressIndicator(),
            )
          : FloatingActionButton(
              onPressed: () => context.pop(),
              child: const Icon(Icons.arrow_back_ios_new_outlined),
              // SpinPerfect(
              //   infinite: true,
              //   child: const Icon(Icons.refresh_rounded),
              // ),
            ),
    );
  }
}
