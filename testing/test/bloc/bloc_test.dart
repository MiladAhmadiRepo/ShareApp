import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testing/bloc/AyaModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/bloc/aya_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'bloc_test.mocks.dart';

///
///
/// 1 step add annotation => @GenerateMocks([Client])
///
/// 2 step => flutter pub run build_runner build
/// 2.1 step => now you can use something like this => final client = MockClient();
///
/// 3 step use when function
/// 3.5 don't forget thenAnswer
///
/// 4 Be Happy !!  you have mockito
///
@GenerateMocks([Client])
void main(){
 group("get aya from Api", (){

   test("get successful data from api", () async {
     String answer ="""
     {\"code\":200,\"status\":\"OK\",\"data\":{\"number\":262,\"text\":\"\\u0627\\u0644\\u0644\\u0651\\u064e\\u0647\\u064f \\u0644\\u064e\\u0627 \\u0625\\u0650\\u0644\\u064e\\u0670\\u0647\\u064e \\u0625\\u0650\\u0644\\u0651\\u064e\\u0627 \\u0647\\u064f\\u0648\\u064e \\u0627\\u0644\\u0652\\u062d\\u064e\\u064a\\u0651\\u064f \\u0627\\u0644\\u0652\\u0642\\u064e\\u064a\\u0651\\u064f\\u0648\\u0645\\u064f \\u06da \\u0644\\u064e\\u0627 \\u062a\\u064e\\u0623\\u0652\\u062e\\u064f\\u0630\\u064f\\u0647\\u064f \\u0633\\u0650\\u0646\\u064e\\u0629\\u064c \\u0648\\u064e\\u0644\\u064e\\u0627 \\u0646\\u064e\\u0648\\u0652\\u0645\\u064c \\u06da \\u0644\\u064e\\u0647\\u064f \\u0645\\u064e\\u0627 \\u0641\\u0650\\u064a \\u0627\\u0644\\u0633\\u0651\\u064e\\u0645\\u064e\\u0627\\u0648\\u064e\\u0627\\u062a\\u0650 \\u0648\\u064e\\u0645\\u064e\\u0627 \\u0641\\u0650\\u064a \\u0627\\u0644\\u0652\\u0623\\u064e\\u0631\\u0652\\u0636\\u0650 \\u06d7 \\u0645\\u064e\\u0646\\u0652 \\u0630\\u064e\\u0627 \\u0627\\u0644\\u0651\\u064e\\u0630\\u0650\\u064a \\u064a\\u064e\\u0634\\u0652\\u0641\\u064e\\u0639\\u064f \\u0639\\u0650\\u0646\\u0652\\u062f\\u064e\\u0647\\u064f \\u0625\\u0650\\u0644\\u0651\\u064e\\u0627 \\u0628\\u0650\\u0625\\u0650\\u0630\\u0652\\u0646\\u0650\\u0647\\u0650 \\u06da \\u064a\\u064e\\u0639\\u0652\\u0644\\u064e\\u0645\\u064f \\u0645\\u064e\\u0627 \\u0628\\u064e\\u064a\\u0652\\u0646\\u064e \\u0623\\u064e\\u064a\\u0652\\u062f\\u0650\\u064a\\u0647\\u0650\\u0645\\u0652 \\u0648\\u064e\\u0645\\u064e\\u0627 \\u062e\\u064e\\u0644\\u0652\\u0641\\u064e\\u0647\\u064f\\u0645\\u0652 \\u06d6 \\u0648\\u064e\\u0644\\u064e\\u0627 \\u064a\\u064f\\u062d\\u0650\\u064a\\u0637\\u064f\\u0648\\u0646\\u064e \\u0628\\u0650\\u0634\\u064e\\u064a\\u0652\\u0621\\u064d \\u0645\\u0650\\u0646\\u0652 \\u0639\\u0650\\u0644\\u0652\\u0645\\u0650\\u0647\\u0650 \\u0625\\u0650\\u0644\\u0651\\u064e\\u0627 \\u0628\\u0650\\u0645\\u064e\\u0627 \\u0634\\u064e\\u0627\\u0621\\u064e \\u06da \\u0648\\u064e\\u0633\\u0650\\u0639\\u064e \\u0643\\u064f\\u0631\\u0652\\u0633\\u0650\\u064a\\u0651\\u064f\\u0647\\u064f \\u0627\\u0644\\u0633\\u0651\\u064e\\u0645\\u064e\\u0627\\u0648\\u064e\\u0627\\u062a\\u0650 \\u0648\\u064e\\u0627\\u0644\\u0652\\u0623\\u064e\\u0631\\u0652\\u0636\\u064e \\u06d6 \\u0648\\u064e\\u0644\\u064e\\u0627 \\u064a\\u064e\\u0626\\u064f\\u0648\\u062f\\u064f\\u0647\\u064f \\u062d\\u0650\\u0641\\u0652\\u0638\\u064f\\u0647\\u064f\\u0645\\u064e\\u0627 \\u06da \\u0648\\u064e\\u0647\\u064f\\u0648\\u064e \\u0627\\u0644\\u0652\\u0639\\u064e\\u0644\\u0650\\u064a\\u0651\\u064f \\u0627\\u0644\\u0652\\u0639\\u064e\\u0638\\u0650\\u064a\\u0645\\u064f\",\"edition\":{\"identifier\":\"quran-simple\",\"language\":\"ar\",\"name\":\"\\u0627\\u0644\\u0642\\u0631\\u0622\\u0646 \\u0627\\u0644\\u0643\\u0631\\u064a\\u0645 \\u0627\\u0644\\u0645\\u0628\\u0633\\u0637 (\\u062a\\u0634\\u0643\\u064a\\u0644 \\u0628\\u0633\\u064a\\u0637)\",\"englishName\":\"Simple\",\"format\":\"text\",\"type\":\"quran\",\"direction\":\"rtl\"},\"surah\":{\"number\":2,\"name\":\"\\u0633\\u064f\\u0648\\u0631\\u064e\\u0629\\u064f \\u0627\\u0644\\u0628\\u064e\\u0642\\u064e\\u0631\\u064e\\u0629\\u0650\",\"englishName\":\"Al-Baqara\",\"englishNameTranslation\":\"The Cow\",\"numberOfAyahs\":286,\"revelationType\":\"Medinan\"},\"numberInSurah\":255,\"juz\":3,\"manzil\":1,\"page\":42,\"ruku\":35,\"hizbQuarter\":17,\"sajda\":false}}
     """;
     final client = MockClient();
     when(client.get(Uri.parse(AyaCubit().apiAddress))).thenAnswer((realInvocation) async {
       return Response(answer,200);
     });
     var ayaCubit = AyaCubit(client: client);
     await Future.delayed(const Duration(milliseconds: 500));
     expectLater(ayaCubit.state.ayaModel,isNot(null));
     expectLater(ayaCubit.state.status,equals(DataStatus.success));
   });


   test("error on getting data from api", () async {
     final client = MockClient();
     when(client.get(Uri.parse(AyaCubit().apiAddress))).thenAnswer((realInvocation) async {
       return Response("404 Error",404);
     });
     var ayaCubit = AyaCubit(client: client);
     await Future.delayed(const Duration(milliseconds: 500));
     await expectLater(ayaCubit.state.ayaModel,equals(null));
     await expectLater(ayaCubit.state.status,equals(DataStatus.failure));
   });

   blocTest<AyaCubit,AyaState>(
     'loading after init',
     build: () {
       final client = MockClient();
       when(client.get(Uri.parse(AyaCubit().apiAddress))).thenAnswer((realInvocation) async {
         return Response("404 Error",404);
       });
       return AyaCubit(client: client);
     },
     expect: () => [isA<AyaState>()],
     /// verify is an optional callback which is invoked after expect and can be used for additional
     verify: (a) {
         a.state.status.isFailure == true;
     }
   );


 });
}