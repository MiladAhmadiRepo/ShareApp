/// code : 200
/// status : "OK"
/// data : {"number":262,"text":"اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ","edition":{"identifier":"quran-simple","language":"ar","name":"القرآن الكريم المبسط (تشكيل بسيط)","englishName":"Simple","format":"text","type":"quran","direction":"rtl"},"surah":{"number":2,"name":"سُورَةُ البَقَرَةِ","englishName":"Al-Baqara","englishNameTranslation":"The Cow","numberOfAyahs":286,"revelationType":"Medinan"},"numberInSurah":255,"juz":3,"manzil":1,"page":42,"ruku":35,"hizbQuarter":17,"sajda":false}

class AyaModel {
  AyaModel({
      int? code, 
      String? status, 
      Data? data,}){
    _code = code;
    _status = status;
    _data = data;
}

  AyaModel.fromJson(dynamic json) {
    _code = json['code'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _code;
  String? _status;
  Data? _data;
AyaModel copyWith({  int? code,
  String? status,
  Data? data,
}) => AyaModel(  code: code ?? _code,
  status: status ?? _status,
  data: data ?? _data,
);
  int? get code => _code;
  String? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// number : 262
/// text : "اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ"
/// edition : {"identifier":"quran-simple","language":"ar","name":"القرآن الكريم المبسط (تشكيل بسيط)","englishName":"Simple","format":"text","type":"quran","direction":"rtl"}
/// surah : {"number":2,"name":"سُورَةُ البَقَرَةِ","englishName":"Al-Baqara","englishNameTranslation":"The Cow","numberOfAyahs":286,"revelationType":"Medinan"}
/// numberInSurah : 255
/// juz : 3
/// manzil : 1
/// page : 42
/// ruku : 35
/// hizbQuarter : 17
/// sajda : false

class Data {
  Data({
      int? number, 
      String? text, 
      Edition? edition, 
      Surah? surah, 
      int? numberInSurah, 
      int? juz, 
      int? manzil, 
      int? page, 
      int? ruku, 
      int? hizbQuarter, 
      bool? sajda,}){
    _number = number;
    _text = text;
    _edition = edition;
    _surah = surah;
    _numberInSurah = numberInSurah;
    _juz = juz;
    _manzil = manzil;
    _page = page;
    _ruku = ruku;
    _hizbQuarter = hizbQuarter;
    _sajda = sajda;
}

  Data.fromJson(dynamic json) {
    _number = json['number'];
    _text = json['text'];
    _edition = json['edition'] != null ? Edition.fromJson(json['edition']) : null;
    _surah = json['surah'] != null ? Surah.fromJson(json['surah']) : null;
    _numberInSurah = json['numberInSurah'];
    _juz = json['juz'];
    _manzil = json['manzil'];
    _page = json['page'];
    _ruku = json['ruku'];
    _hizbQuarter = json['hizbQuarter'];
    _sajda = json['sajda'];
  }
  int? _number;
  String? _text;
  Edition? _edition;
  Surah? _surah;
  int? _numberInSurah;
  int? _juz;
  int? _manzil;
  int? _page;
  int? _ruku;
  int? _hizbQuarter;
  bool? _sajda;
Data copyWith({  int? number,
  String? text,
  Edition? edition,
  Surah? surah,
  int? numberInSurah,
  int? juz,
  int? manzil,
  int? page,
  int? ruku,
  int? hizbQuarter,
  bool? sajda,
}) => Data(  number: number ?? _number,
  text: text ?? _text,
  edition: edition ?? _edition,
  surah: surah ?? _surah,
  numberInSurah: numberInSurah ?? _numberInSurah,
  juz: juz ?? _juz,
  manzil: manzil ?? _manzil,
  page: page ?? _page,
  ruku: ruku ?? _ruku,
  hizbQuarter: hizbQuarter ?? _hizbQuarter,
  sajda: sajda ?? _sajda,
);
  int? get number => _number;
  String? get text => _text;
  Edition? get edition => _edition;
  Surah? get surah => _surah;
  int? get numberInSurah => _numberInSurah;
  int? get juz => _juz;
  int? get manzil => _manzil;
  int? get page => _page;
  int? get ruku => _ruku;
  int? get hizbQuarter => _hizbQuarter;
  bool? get sajda => _sajda;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['text'] = _text;
    if (_edition != null) {
      map['edition'] = _edition?.toJson();
    }
    if (_surah != null) {
      map['surah'] = _surah?.toJson();
    }
    map['numberInSurah'] = _numberInSurah;
    map['juz'] = _juz;
    map['manzil'] = _manzil;
    map['page'] = _page;
    map['ruku'] = _ruku;
    map['hizbQuarter'] = _hizbQuarter;
    map['sajda'] = _sajda;
    return map;
  }

}

/// number : 2
/// name : "سُورَةُ البَقَرَةِ"
/// englishName : "Al-Baqara"
/// englishNameTranslation : "The Cow"
/// numberOfAyahs : 286
/// revelationType : "Medinan"

class Surah {
  Surah({
      int? number, 
      String? name, 
      String? englishName, 
      String? englishNameTranslation, 
      int? numberOfAyahs, 
      String? revelationType,}){
    _number = number;
    _name = name;
    _englishName = englishName;
    _englishNameTranslation = englishNameTranslation;
    _numberOfAyahs = numberOfAyahs;
    _revelationType = revelationType;
}

  Surah.fromJson(dynamic json) {
    _number = json['number'];
    _name = json['name'];
    _englishName = json['englishName'];
    _englishNameTranslation = json['englishNameTranslation'];
    _numberOfAyahs = json['numberOfAyahs'];
    _revelationType = json['revelationType'];
  }
  int? _number;
  String? _name;
  String? _englishName;
  String? _englishNameTranslation;
  int? _numberOfAyahs;
  String? _revelationType;
Surah copyWith({  int? number,
  String? name,
  String? englishName,
  String? englishNameTranslation,
  int? numberOfAyahs,
  String? revelationType,
}) => Surah(  number: number ?? _number,
  name: name ?? _name,
  englishName: englishName ?? _englishName,
  englishNameTranslation: englishNameTranslation ?? _englishNameTranslation,
  numberOfAyahs: numberOfAyahs ?? _numberOfAyahs,
  revelationType: revelationType ?? _revelationType,
);
  int? get number => _number;
  String? get name => _name;
  String? get englishName => _englishName;
  String? get englishNameTranslation => _englishNameTranslation;
  int? get numberOfAyahs => _numberOfAyahs;
  String? get revelationType => _revelationType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['name'] = _name;
    map['englishName'] = _englishName;
    map['englishNameTranslation'] = _englishNameTranslation;
    map['numberOfAyahs'] = _numberOfAyahs;
    map['revelationType'] = _revelationType;
    return map;
  }

}

/// identifier : "quran-simple"
/// language : "ar"
/// name : "القرآن الكريم المبسط (تشكيل بسيط)"
/// englishName : "Simple"
/// format : "text"
/// type : "quran"
/// direction : "rtl"

class Edition {
  Edition({
      String? identifier, 
      String? language, 
      String? name, 
      String? englishName, 
      String? format, 
      String? type, 
      String? direction,}){
    _identifier = identifier;
    _language = language;
    _name = name;
    _englishName = englishName;
    _format = format;
    _type = type;
    _direction = direction;
}

  Edition.fromJson(dynamic json) {
    _identifier = json['identifier'];
    _language = json['language'];
    _name = json['name'];
    _englishName = json['englishName'];
    _format = json['format'];
    _type = json['type'];
    _direction = json['direction'];
  }
  String? _identifier;
  String? _language;
  String? _name;
  String? _englishName;
  String? _format;
  String? _type;
  String? _direction;
Edition copyWith({  String? identifier,
  String? language,
  String? name,
  String? englishName,
  String? format,
  String? type,
  String? direction,
}) => Edition(  identifier: identifier ?? _identifier,
  language: language ?? _language,
  name: name ?? _name,
  englishName: englishName ?? _englishName,
  format: format ?? _format,
  type: type ?? _type,
  direction: direction ?? _direction,
);
  String? get identifier => _identifier;
  String? get language => _language;
  String? get name => _name;
  String? get englishName => _englishName;
  String? get format => _format;
  String? get type => _type;
  String? get direction => _direction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier'] = _identifier;
    map['language'] = _language;
    map['name'] = _name;
    map['englishName'] = _englishName;
    map['format'] = _format;
    map['type'] = _type;
    map['direction'] = _direction;
    return map;
  }

}