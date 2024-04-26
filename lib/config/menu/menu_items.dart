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
    link: '/buttons',
    iconData: Icons.smart_button_outlined,
  ),
  MenuItem(
    titLe: 'Tarjetas',
    subtitle: 'Contenedor estilizado',
    link: '/cards',
    iconData: Icons.credit_card,
  ),
];
