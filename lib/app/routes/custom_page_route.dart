import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  final Offset begin;

  CustomPageRoute({required this.page, required this.begin})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOut;

            var curvedAnimation =
                CurvedAnimation(parent: animation, curve: curve);

            return SlideTransition(
              position: Tween<Offset>(begin: begin, end: Offset.zero)
                  .animate(curvedAnimation),
              child: child,
            );
          },
        );
}
