import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/SimpleProvider/model/model.dart';
import '../provider/bread_crumb_provider.dart';

class NewBreadCrumbWidget extends StatelessWidget {
  NewBreadCrumbWidget({Key? key}) : super(key: key);
  late TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("new"),
        ),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "add new bread crumb text"
              ),
            ),
            TextButton(onPressed: () {
              context.read<BreadCrumbProvider>().add(BreadCrumb(isActive: false, name: _controller.text));
              Navigator.pop(context);
            }, child: Text('add')),
          ],
        ));

  }
}
