import 'package:Organiser/views/widgets/common/back_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions,
    this.title,
    this.leading,
    this.leadingWidth,
    this.centerTitle,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      scrolledUnderElevation: 0.0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (bottom != null) bottom!,
            Container(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              height: 0.3,
            ),
          ],
        ),
      ),
      title: title,
      actions: actions,
      leading: leading ?? CustomBackButton(),
      leadingWidth: leadingWidth,
      centerTitle: centerTitle ?? true,
    );
  }

  final List<Widget>? actions;
  final Widget? title;
  final Widget? leading;
  final double? leadingWidth;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
