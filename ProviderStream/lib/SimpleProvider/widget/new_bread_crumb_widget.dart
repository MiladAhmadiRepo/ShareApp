import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stream/SimpleProvider/model/model.dart';
import '../provider/bread_crumb_provider.dart';

class NewBreadCrumbWidget extends StatelessWidget {
  late TextEditingController _controller;

  NewBreadCrumbWidget({Key? key}) : super(key: key){
    _controller=TextEditingController();
  }
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
