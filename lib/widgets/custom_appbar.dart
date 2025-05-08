import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String leading;
  final String action;
  const CustomAppbar({
    super.key,
    required this.title,
    required this.action,
    required this.leading,
  });

  @override
  Size get preferredSize => Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[300],
      elevation: 0.0,

      scrolledUnderElevation: 0.0,
      toolbarHeight: preferredSize.height,
      leading: SizedBox.shrink(),
      leadingWidth: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(leading, width: 35, height: 35),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SvgPicture.asset(action, width: 24),
        ],
      ),
      // leading: leading,
      // actions: action,
      // centerTitle: true,
    );
  }
}
