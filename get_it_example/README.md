# Dependency Injection In Flutter Using Get_It
 

## Getting Started

That's according to Wikipedia. In other words, when class A uses functionalities from class B,

then it can be said that class A is dependent on class B.

## Details of project
From the my example the Api class is dependent on the Client class

and the most basic way to inject this dependency would be to pass it through the constructor

```diff
class Api {
    Client client;

    Api({this.client});
    //...
}

```
To Call HomeScreen somewhere in the codebase we would pass in the Api class it depends

on and also pass in the Client class that the Api class depends on
```diff
HomeScreen(api: Api(client: Client()));

}

```

I'm sure we can see how things can easily get out of hand when we try to access classes 

with multiple dependencies across multiple places in the codebase.

This is where Get_it comes in. With Get_it we simply register our Dart classes/Objects 

and the classes they depend on, which can then be easily accessed from anywhere.

So far we've been able to write unit, widget and integration test for a very simple 

flutter app in the previous articles. And this was possible because we injected our 

class dependencies through the constructor, that way when we write the test for 

the class we can mock those dependencies and pass the mocked versions 

through the constructors. Which allows us to control the behavior of the mocked class.

## Registering the classes

Using get_it, classes can be registered in two ways.

> **Factory**: With Factory registration, when you request an instance of the class from GetIt you'll 

get a new instance every time. Good for registering ViewModels that need to run the same logic 

on start or that has to be new when the view is opened.

> **Singleton**: Singletons can be registered in two ways. 

Provide an Instance of the class upon registration (registerSingleton) 

or provide an anonymous function that will be invoked the first time the class is 

needed (registerLazySingleton). The service locator keeps a single instance of your 

registered type for the rest of the apps lifetime and will always return 

you that instance when requested.

Registering classes as LazySingletons helps with performance as the classes are only

created when needed unlike registering as Singleton which creates 

the classes when the app starts.

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

 
