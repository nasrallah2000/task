import 'package:flutter/material.dart';

class HomeTopHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeTopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        color: Colors.pink,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              'خصومات وشحن مجاني بترقية حسابك الى كوينا سجلي الان',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
