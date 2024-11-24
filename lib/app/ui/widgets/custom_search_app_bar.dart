import 'package:flutter/material.dart';
import 'search_text_field.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool isSearching;
  final String searchText;
  final Animation<double> animation;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchToggle;

  const CustomSearchAppBar({
    super.key,
    required this.title,
    required this.isSearching,
    required this.searchText,
    required this.animation,
    required this.onSearchChanged,
    required this.onSearchToggle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.teal[500],
      title: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return isSearching
              ? SearchTextField(
                  animation: animation,
                  onChanged: onSearchChanged,
                )
              : Text(title);
        },
      ),
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(isSearching ? Icons.close : Icons.search),
          onPressed: onSearchToggle,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
