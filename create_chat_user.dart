import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatChatUser extends StatelessWidget {
  const CreatChatUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Create Your User Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  inputFormatters: [
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      if (newValue.text.contains(' ')) {
                        return oldValue;
                      }
                      return newValue;
                    })
                  ],
                ),
                ElevatedButton(onPressed: () {}, child: const Text('Create'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
