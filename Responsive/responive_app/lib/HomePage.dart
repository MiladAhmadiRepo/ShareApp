import 'package:flutter/material.dart';
import 'package:responive_app/widgets.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = const [
      MenuItem(),
      MenuItem(),
      MenuItem(),
    ];

    var responsiveValue = ResponsiveValue<double>(context, defaultValue: 350, valueWhen:[
      const Condition.largerThan(
        name: MOBILE,
        value: 500,
      ),
    ]);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: responsiveValue.value ?? 350,
          child: ResponsiveRowColumn(
            layout: ResponsiveWrapper.of(context).isLargerThan(MOBILE)
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              if(ResponsiveWrapper.of(context).isLargerThan(MOBILE))
                ResponsiveRowColumnItem(
                  child: SizedBox(
                      width: 150,
                      child: ListView(children:menuItems,shrinkWrap: true,)),
                ),
              if(ResponsiveWrapper.of(context).isSmallerThan(TABLET))
                ResponsiveRowColumnItem(
                  child: ExpansionTile(title: const ListTile(title: Text("Menu"),),
                    children:menuItems,),
                ),
              const ResponsiveRowColumnItem(
                child: Expanded(child: ListOfItems()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(title: Text("menu Item"));
  }
}


class ListOfItems extends StatelessWidget {
  const ListOfItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
    itemCount: 30,
    itemBuilder: (context, index) => const CardWidget(),
    );
  }
}
