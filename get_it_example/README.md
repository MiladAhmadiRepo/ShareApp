# Dependency Injection In Flutter Using Get_It
 

## Getting Started

That's according to Wikipedia. In other words, when class A uses functionalities from class B,

then it can be said that class A is dependent on class B.

## Details of project
From the my example the Api class is dependent on the Client class

and the most basic way to inject this dependency would be to pass it through the constructor

```dart
class Api {
    Client client;

    Api({this.client});
    //...
}

```
To Call HomeScreen somewhere in the codebase we would pass in the Api class it depends

on and also pass in the Client class that the Api class depends on
```dart
HomeScreen(api: Api(client: Client()));

}

```

``` diff 

I'm sure we can see how things can easily get out of hand when we try to access classes 

with multiple dependencies across multiple places in the codebase.

This is where Get_it comes in. 

```


With Get_it we simply register our Dart classes/Objects 

and the classes they depend on, which can then be easily accessed from anywhere.

So far we've been able to write unit, widget and integration test for a very simple 

flutter app in the previous articles. And this was possible because we injected our 

class dependencies through the constructor, that way when we write the test for 

the class we can mock those dependencies and pass the mocked versions 

through the constructors. Which allows us to control the behavior of the mocked class.

## Registering the classes

Using get_it, classes can be registered in two ways.

> **Factory**: With Factory registration, when you request an instance of the class from GetIt you'll 

```diff
get a new instance every time. Good for registering ViewModels that need to run the same logic 

on start or that has to be new when the view is opened.
```
> **Singleton**: Singletons can be registered in two ways. 

```diff

Provide an Instance of the class upon registration (registerSingleton) 

or provide an anonymous function that will be invoked the first time the class is 

needed (registerLazySingleton). The service locator keeps a single instance of your 

registered type for the rest of the apps lifetime and will always return 

you that instance when requested.

Registering classes as LazySingletons helps with performance as the classes are only

created when needed unlike registering as Singleton which creates 

the classes when the app starts.
```
 
-------------------------------------------------------------------------------

First create a file named injection.dart under the lib folder.

This is where we would register our Dart classes.

For our joke app the only Dart class we would need to register is 

the Api class and its dependency (the Client class). 

To do this we call sl.registerLazySingleton(() {});

```dart

sl.registerLazySingleton<Api>(() => Api(client: sl()));

sl.registerLazySingleton<Client>(() => Client());

```

What's going on is we register a LazySingleton of Type Api which returns 

an instance of our Api class when its needed. The Api class also depends on 

the client class and we simply call sl() in its place. This tells the service 

locator to find a registered instance of Type Client which we've also registered.

The complete injection.dart file

```dart
 
import 'package:example/api.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final sl = GetIt.instance;

void initGetIt() {
  sl.registerLazySingleton<Api>(() => Api(client: sl()));

  sl.registerLazySingleton<Client>(() => Client());
}

```

## Using The Service Locator

To make use of the service locator we have to initialize it by running

the initGetIt method before runApp in main.dart

```dart
void main() {
  initGetIt();
  runApp(MyApp());
}

```

And the MyApp class which formerly looked like this

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///...
      home: MyHomePage(api: Api(client: http.Client())),
    );
  }
}

```

Becomes this

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //...
      home: MyHomePage(api: sl<Api>()),
    );
  }
}

```
So that's basically it. The more an app grows the more services like Get_it

would be required. Especially when following clean architecture and writing test

as there would be a lot of dependency injections going on in the codebase.

 
