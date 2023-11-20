/// id : 85433
/// user_id : 5716305
/// title : "Alienus voluptatum ara amita delinquo aperiam degero et."
/// body : "Aut iusto debitis. Ipsam velum omnis. Repudiandae defleo animi. Thesaurus quia rerum. Pecto benigne beatae. Casus minima copiose. Aegre ea accendo. Temeritas statua curia. Spes vel consequatur. Virgo cotidie denuncio. Color vita virtus. Unde nemo repudiandae."

class PostModel {
  PostModel({
    num? id,
    num? userId,
    String? title,
    String? body,
  }) {
    _id = id;
    _userId = userId;
    _title = title;
    _body = body;
  }

  PostModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _title = json['title'];
    _body = json['body'];
  }

  num? _id;
  num? _userId;
  String? _title;
  String? _body;

  PostModel copyWith({
    num? id,
    num? userId,
    String? title,
    String? body,
  }) =>
      PostModel(
        id: id ?? _id,
        userId: userId ?? _userId,
        title: title ?? _title,
        body: body ?? _body,
      );

  num? get id => _id;

  num? get userId => _userId;

  String? get title => _title;

  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }
}
