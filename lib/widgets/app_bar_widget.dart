import 'package:crypto_watch/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.actionIcon,
    required this.actionOnTap,
    required this.title,
    required this.isApiActive,
    required this.leadingOnTap,
  });

  final IconData actionIcon;
  final bool isApiActive;
  final void Function() actionOnTap;
  final void Function(bool) leadingOnTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 2),
      child: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        leading: Builder(builder: (context) {
          return Switch(
            value: isApiActive,
            onChanged: leadingOnTap,
            activeColor: AppColors.primaryTextColor,
          );
        }),
        actions: [
          SizedBox(
            width: 50,
            height: double.infinity,
            child: IconButton(
              icon: Icon(
                actionIcon,
                size: 28,
              ),
              onPressed: actionOnTap,
            ),
          )
        ],
      ),
    );
  }
}
