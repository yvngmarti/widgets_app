import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls + Tiles'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool switchAlone = false;
  bool isDeveloper = true;
  // este seria nuestro valor a capturar selectedTransportation
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        // la ventaja de tener un SwitchListTile es que al estar dentro de la list podemos realizar mas facilmente la accion de este switch debido a que solo con presionar en el espacio que ocupa ya se haria la accion
        SwitchListTile(
          title: const Text('Modo desarrollador'),
          subtitle: const Text('Controles adicionales'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        const SizedBox(
          height: 20,
        ),
        Switch(
          value: switchAlone,
          onChanged: (value) => setState(() {
            switchAlone = !switchAlone;
          }),
        ),
        const SizedBox(
          height: 20,
        ),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          // enabled: true,
          initiallyExpanded: true,
          expansionAnimationStyle: AnimationStyle(
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceOut,
          ),
          children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viajar en carro'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar en barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar en avion'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Viajar en submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('¿Incluir desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Incluir almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Incluir cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
