import 'package:flutter/material.dart';

class MenuItem {
  final String titLe;
  final String subtitle;
  final String link;
  final IconData iconData;

  const MenuItem({
    required this.titLe,
    required this.subtitle,
    required this.link,
    required this.iconData,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    titLe: 'Botones',
    subtitle: 'Botones varios',
    link: '/botones',
    iconData: Icons.smart_button_outlined,
  ),
  MenuItem(
    titLe: 'Tarjetas',
    subtitle: 'Contenedor estilizado',
    link: '/card',
    iconData: Icons.credit_card,
  ),
];
