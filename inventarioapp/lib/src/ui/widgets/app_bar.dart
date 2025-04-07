import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Inventário Móvel", style: TextStyle(color: Colors.white),),
      toolbarHeight: 90,
      backgroundColor: Color(0xFF006989),
      iconTheme: IconThemeData(color: Colors.white),
    );
  }
  @override
  Size get preferredSize  => Size.fromHeight(45);
}
