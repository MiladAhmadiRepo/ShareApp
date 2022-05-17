class Model {
  Success? success;
  Contents? contents;

  Model({this.success, this.contents});

  Model.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? new Success.fromJson(json['success']) : null;
    contents = json['contents'] != null
        ? new Contents.fromJson(json['contents'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success!.toJson();
    }
    if (this.contents != null) {
      data['contents'] = this.contents!.toJson();
    }
    return data;
  }
}

class Success {
  int? total;

  Success({this.total});

  Success.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}

class Contents {
  List<Jokes>? jokes;
  String? copyright;

  Contents({this.jokes, this.copyright});

  Contents.fromJson(Map<String, dynamic> json) {
    if (json['jokes'] != null) {
      jokes = <Jokes>[];
      json['jokes'].forEach((v) {
        jokes!.add(new Jokes.fromJson(v));
      });
    }
    copyright = json['copyright'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jokes != null) {
      data['jokes'] = this.jokes!.map((v) => v.toJson()).toList();
    }
    data['copyright'] = this.copyright;
    return data;
  }
}

class Jokes {
  String? description;
  String? language;
  String? background;
  String? category;
  String? date;
  Joke? joke;

  Jokes(
      {this.description,
        this.language,
        this.background,
        this.category,
        this.date,
        this.joke});

  Jokes.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    language = json['language'];
    background = json['background'];
    category = json['category'];
    date = json['date'];
    joke = json['joke'] != null ? new Joke.fromJson(json['joke']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['language'] = this.language;
    data['background'] = this.background;
    data['category'] = this.category;
    data['date'] = this.date;
    if (this.joke != null) {
      data['joke'] = this.joke!.toJson();
    }
    return data;
  }
}

class Joke {
  String? title;
  String? lang;
  String? length;
  String? clean;
  String? racial;
  String? date;
  String? id;
  String? text;

  Joke(
      {this.title,
        this.lang,
        this.length,
        this.clean,
        this.racial,
        this.date,
        this.id,
        this.text});

  Joke.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    lang = json['lang'];
    length = json['length'];
    clean = json['clean'];
    racial = json['racial'];
    date = json['date'];
    id = json['id'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['lang'] = this.lang;
    data['length'] = this.length;
    data['clean'] = this.clean;
    data['racial'] = this.racial;
    data['date'] = this.date;
    data['id'] = this.id;
    data['text'] = this.text;
    return data;
  }
}
