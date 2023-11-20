/// id : 49026
/// post_id : 59492
/// name : "Anandamayi Pillai"
/// email : "pillai_anandamayi@jacobs.test"
/// body : "Aut mollitia labore. Enim provident consectetur. Nostrum rem quae."

class CommentModel {
  CommentModel({
      num? id, 
      num? postId, 
      String? name, 
      String? email, 
      String? body,}){
    _id = id;
    _postId = postId;
    _name = name;
    _email = email;
    _body = body;
}

  CommentModel.fromJson(dynamic json) {
    _id = json['id'];
    _postId = json['post_id'];
    _name = json['name'];
    _email = json['email'];
    _body = json['body'];
  }
  num? _id;
  num? _postId;
  String? _name;
  String? _email;
  String? _body;
CommentModel copyWith({  num? id,
  num? postId,
  String? name,
  String? email,
  String? body,
}) => CommentModel(  id: id ?? _id,
  postId: postId ?? _postId,
  name: name ?? _name,
  email: email ?? _email,
  body: body ?? _body,
);
  num? get id => _id;
  num? get postId => _postId;
  String? get name => _name;
  String? get email => _email;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['post_id'] = _postId;
    map['name'] = _name;
    map['email'] = _email;
    map['body'] = _body;
    return map;
  }

}