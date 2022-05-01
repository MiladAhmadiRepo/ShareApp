# json_serializable

سریالایز پروسه ای هست که یک شی رو به چیزی تبدیل کنیم که بتوان در دیتابیس ذخیره کرد یا به عنوان داده دریافتی از وب سرویس دریافت کرد .
در مثال پایین میخواهیم json دریافتی از سرور رو به یک instance از obeject تبدیل کنیم .

 

<img src="https://miro.medium.com/max/1400/1*cRujRuBevUWdOfprIDsF-w.png"/>


# Basic Network Request — Example App
با کمک   - [RandomUserAPI](https://randomuser.me/)
 یک اپ درست میکنیم که لیستی از گاربران را نمایش دهد .
 

<img src="https://miro.medium.com/max/734/1*HcLcT3jbYnDp8qc45otUCg.png"/>

# اگر بخواهیم دستی تبدیل کنیم مشکلات زیر به وجود میاید :

As you probably already have seen, we have to write all the key strings into the class and pollute our class with API information.

Additionally, we come into the trap that if we want to add or remove an attribute, we have to change it all over.

That makes the maintainability pretty hard. Especially if the API changes and we have to create it from scratch.

That would lead to a lot of searches and replacements, and we will lose all IDE supports.


# Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.3
  http: ^0.12.0+4
  json_annotation: ^3.0.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^1.8.1
  json_serializable: ^3.3.0
```


# ساخت مدل برای json serialize

```dart
part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  NameModel name;
  String phone;
  String email;
  PictureModel picture;

  PersonModel({this.name, this.phone, this.email, this.picture});

  factory PersonModel.fromJson(Map<String, dynamic> json) => _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}
```

# اوضیحات برای کلاس مدلی که ایجاد کردیم

Line 1: With the part ‘person_model.g.dart’ we give the PersonModel class the possibility to access the methods inside of the person_model.g.dart file. The file will be generated later from the built_runner.


Line 3: The @JsonSerializable() annotation tells the build_runner that this class has to be concerned for the generation of a new file and creation of a serialization.


Line 5 + 8: For objects inside of our JSON we have to create their representing Model classes for NameModel and PictureModel. The new models will also be annotated with @JsonSerializable() and will also get the two new methods from line 12 and 14.

Line 12: The new factory constructor fromJson is close to our old method. But instead of creating a new Instance of the PersonModel, we call a method _$PersonModelFromJson(json). This method will be generated later with the help of built_runner.

Line 14: The toJson method returns as expected a Json (in Dart a Map between String and dynamic). To receive the map we call the generated function _$PersonModelToJson(this), and pass the current instance inside.



# Generated Serialization

استفاده از json_serializable package 

این پکیج با پکیج build_runner کار میکند و به ما اجازه ایجاد  “fromJSON” and “toJSON” functions را میدهد ، بدون اینکه همه key ها در جیسون ینویسیم 

و فقط ما باید مدل را درست وارد کنیم
 
# حال دستور زیر را در terminal  اجرا کنید 

flutter pub run build_runner build
 
