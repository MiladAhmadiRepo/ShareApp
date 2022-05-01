
# Code Snippets

# ----------------------------------- 

In Android Studio go to Settings (Preferences on Mac) > Editor > Live Templates.

Expand the Flutter option. You should see some live templates already defined. To create a new one click the + add button on the right and choose Live templates.

https://i.stack.imgur.com/f13zE.png

<img src="https://i.stack.imgur.com/f13zE.png" alt="J"/>


Add an abreviation that you can use in code. Also write a description. Then paste in the code that you want to auto insert.


#Finally, where it says "Define" choose Dart and flutter from the list. Then choose OK.

https://i.stack.imgur.com/TdQnF.png

If there are any variable names that you want to fill in later you can surround them with $ signs like $NAME$.
 

#Example

Whenever I want to test some widget, I make a new app with a clean layout, none of those comments and extra widgets. Here is a live template that is just a basic starting layout.

I called the abbreviation basiclayout and the code is

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

Now I can just start typing basiclayout to get all that code inserted automatically. I could have replaced the My App string or the BodyWidget name with a $NAME$ variable if I wanted to choose a new name every time.
