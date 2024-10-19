import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({
    super.key,
    this.title,
    this.leadinIcon,
    required this.hasBG,
    this.leadingonPressed,
    this.image, this.trailingWidget,
  });

  final Widget? title;
  final Widget? trailingWidget;
  final IconData? leadinIcon;
  final bool hasBG;
  final void Function()? leadingonPressed;
  final Image? image;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        trailingWidget == null
            ? const SizedBox()
            : trailingWidget!
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
