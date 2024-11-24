import 'package:flutter/material.dart';

import '../theme/theme.dart';

class NavigationBarSaveButtonWidget extends StatelessWidget {
  const NavigationBarSaveButtonWidget({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          // onPressed: () async {
          //   if (_controller.formKey.currentState!.validate()) {
          //     _controller.addContact(context).then((_) {
          //       Navigator.of(context).pop(true);
          //     });
          //   }
          // },
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: ThemeApp.appBarColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            elevation: 5,
          ),
          child: const Text(
            'Save',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
