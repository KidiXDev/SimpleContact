import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../data/providers/contact_provider.dart';
import '../../routes/pages_route.dart';
import '../widgets/contact_list_widgets.dart';
import '../widgets/custom_search_app_bar.dart';
import '../utils/searchable_state_mixin.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages>
    with TickerProviderStateMixin, SearchableStateMixin {
  @override
  void initState() {
    super.initState();
    Provider.of<ContactProvider>(context, listen: false).loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    final contacts = Provider.of<ContactProvider>(context).contacts;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        SystemNavigator.pop();
      },
      child: GestureDetector(
        onTap: () {
          closeSearchIfEmpty();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.teal[100],
          appBar: CustomSearchAppBar(
            title: 'Contact',
            isSearching: isSearching,
            searchText: searchText,
            animation: searchAnimation,
            onSearchChanged: updateSearchText,
            onSearchToggle: toggleSearch,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                if (searchText.isEmpty ||
                    contacts[index]
                        .name
                        .toLowerCase()
                        .contains(searchText.toLowerCase())) {
                  return ContactListWidgets(contacts: contacts[index]);
                }
                return Container();
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(RoutesName.addContactPage)
                  .then((args) {
                if (args != null && args as bool) {
                  var snackbar = SnackBar(
                    content: const Text('Contact added successfully'),
                    backgroundColor: Colors.teal[500],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              });
            },
            backgroundColor: Colors.teal[500],
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
