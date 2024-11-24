import 'package:flutter/material.dart';

mixin SearchableStateMixin<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  bool _isSearching = false;
  String _searchText = "";
  late AnimationController _searchController;
  late Animation<double> _searchAnimation;

  bool get isSearching => _isSearching;
  String get searchText => _searchText;
  Animation<double> get searchAnimation => _searchAnimation;

  @override
  void initState() {
    super.initState();
    _searchController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _searchAnimation = CurvedAnimation(
      parent: _searchController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (_isSearching) {
        _searchController.forward();
      } else {
        _searchController.reverse();
        _searchText = "";
      }
    });
  }

  void updateSearchText(String value) {
    setState(() {
      _searchText = value;
    });
  }

  void closeSearchIfEmpty() {
    if (_isSearching && _searchText.isEmpty) {
      setState(() {
        _searchController.reverse().then((_) {
          setState(() {
            _isSearching = false;
            _searchText = "";
          });
        });
      });
    }
  }
}
