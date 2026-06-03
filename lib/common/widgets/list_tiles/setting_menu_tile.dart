import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce_app/utils/constants/colors.dart';
class TSettingsMenuTile extends StatelessWidget {


  const TSettingsMenuTile({super.key,
  required this.icon,
  // ignore: non_constant_identifier_names
  required this.Title,
  required this.subtitle,
  this.trailing,
  this.onTap,
  });

final IconData icon;
final String Title, subtitle;
final Widget? trailing;
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 20, color: TColors.primary),
      title: Text(Title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}