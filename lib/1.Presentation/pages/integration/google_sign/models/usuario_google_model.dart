import 'dart:convert';

class UsuarioGoogleModel {
    String nombre;
    String correo;
    String? photoUrl;

    UsuarioGoogleModel({
        required this.nombre,
        required this.correo,
        required this.photoUrl,
    });

    UsuarioGoogleModel copyWith({
        String? nombre,
        String? correo,
        String? photoUrl,
    }) => 
        UsuarioGoogleModel(
            nombre: nombre ?? this.nombre,
            correo: correo ?? this.correo,
            photoUrl: photoUrl ?? this.photoUrl,
        );

    factory UsuarioGoogleModel.fromJson(String str) => UsuarioGoogleModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioGoogleModel.fromMap(Map<String, dynamic> json) => UsuarioGoogleModel(
        nombre: json["nombre"],
        correo: json["correo"],
        photoUrl: json["photoUrl"],
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "correo": correo,
        "photoUrl": photoUrl,
    };
}
