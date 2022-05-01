# provider_stream
```diff
- simple provider 
+ stream provider
! any kind of provider
# how to use them
@@ and test them @@
```
## Getting Started

- [SimpleProvider](https://github.com/ShowAppStructure/ShareApp/tree/master/ProviderStream/lib/SimpleProvider)
  
- [StreamProvider](https://github.com/ShowAppStructure/ShareApp/tree/master/ProviderStream/lib/StreamProvider)

---------------------------------------------------------------------

## موارد استفاده از Read 

مورد استفاده از read به این شکل است که

به provider گفته میشود یه snapshop از خودت بگیر و یک

کاری رو انجام بده

یا برای گرفتن یک مقدار از داخل provider 

از read استفاده میشود 

 برای expecting یا تغییر یک متغییر که میخواهد ui رو اپدیت کند  از read استفاده نکنید

داخل متد read در پکیج provider خط زیر قرار دارد

Provider.of<T>(this, listen: false);

که نشان دهنده این است که به تغییرات گوش نمیدهد و فقط برای

اجرای یک اکشن یا تابع است

--------------------------------------------------------------------

```diff
- ------------------------------------------------------------------------------------
```

## موارد استفاده از select

اگر میخواهید به یک بخش خاص از provider 

نگاه شود و با تغییرات 

آن ui بروزرسانی شود 

از selectاستفاده کنید

- ---------------------------------------------------------------

همچنین نکته مهم از Select در تابع 

کلیک یا callback دکمه استفاده نکنید 

و آن را در ایتدایی ترین خط 

متد build در stateless یا متد build در کلاس state موجود در stateful قرار دهید

- ---------------------------------------------------------------

اگر به داخل کد موجود در select مراجغه کنیم میبینیم که 

از یک provider.of با مقدار پیش فرض listen  true ساخته 

شده است پس به هر تغییری گوش میدهد 

```diff
- ------------------------------------------------------------------------------------
```
 
