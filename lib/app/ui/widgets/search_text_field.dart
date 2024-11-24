import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final Animation<double> animation;
  final ValueChanged<String> onChanged;

  const SearchTextField({
    super.key,
    required this.animation,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.teal[300],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }
}
