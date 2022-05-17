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
 
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

 
