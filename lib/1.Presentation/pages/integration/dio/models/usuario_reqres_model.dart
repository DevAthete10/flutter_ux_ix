import 'dart:convert';

class UsuarioReqresModel {
    int id;
    String email;
    String firstName;
    String lastName;
    String avatar;
    String? job;

    UsuarioReqresModel({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,        
        this.job,        
    });

    UsuarioReqresModel copyWith({
        int? id,
        String? email,
        String? firstName,
        String? lastName,
        String? avatar,
        String? job,
    }) => 
        UsuarioReqresModel(
            id: id ?? this.id,
            email: email ?? this.email,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            avatar: avatar ?? this.avatar,
            job: job ?? this.job,
        );

    factory UsuarioReqresModel.fromJson(String str) => UsuarioReqresModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioReqresModel.fromMap(Map<String, dynamic> json) => UsuarioReqresModel(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        job: json["job"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "job": job,
    };
}
