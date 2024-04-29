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
  MenuItem(
    titLe: 'Indicadores de progreso',
    subtitle: 'Generales y controlados',
    link: '/progress',
    iconData: Icons.refresh_outlined,
  ),
  MenuItem(
    titLe: 'Snackbars y dialogos',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbars',
    iconData: Icons.info_outline,
  ),
  MenuItem(
    titLe: 'Animated container',
    subtitle: 'Stateful widget animado',
    link: '/animated',
    iconData: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    titLe: 'UI Controls + Tiles',
    subtitle: 'Los controles del usuario en flutter',
    link: '/ui-controls',
    iconData: Icons.control_camera_outlined,
  ),
];
