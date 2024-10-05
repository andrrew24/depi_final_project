import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
    this.title,
    this.leadinIcon,
    required this.hasBG,
    this.leadingonPressed,
    this.trailingIcon,
    this.trailingonPressed,
  });

  final Widget? title;
  final IconData? leadinIcon;
  final IconData? trailingIcon;
  final bool hasBG;
  final void Function()? leadingonPressed;
  final void Function()? trailingonPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        trailingIcon == null
            ? const SizedBox()
            : IconButton(
                onPressed: trailingonPressed,
                icon: Icon(
                  trailingIcon,
                  color: Colors.white,
                  size: 20,
                ))
      ],
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        onPressed: leadingonPressed,
        splashRadius: 1,
        icon: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: hasBG ? Colors.white.withOpacity(0.03) : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(leadinIcon, size: 20, color: Colors.white),
        ),
      ),
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
