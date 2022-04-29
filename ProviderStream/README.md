# provider_stream

## Getting Started


- [provider](https://flutter.dev/docs/get-started/codelab)


###Read


مورد استفاده از read به این شکل است که

به provider گفته میشود یه snapshop از خودت بگیر و یک

کاری رو انجام بده

از read برای expecting یا تغییر یک متغییر که میخواهد ui رو اپدیت کند استفاده نکنید

داخل متد read خط زیر قرار دارد

Provider.of<T>(this, listen: false);

که نشان دهنده این است که به تغییرات گوش نمیدهد و فقط برای

اجرای یک اکشن یا تابع است

