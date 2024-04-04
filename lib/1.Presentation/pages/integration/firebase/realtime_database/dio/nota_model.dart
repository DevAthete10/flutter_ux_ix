import 'dart:convert';

class NotaModel {
    String? id;
    String titulo;
    String descripcion;

    NotaModel({
        this.id,
        required this.titulo,
        required this.descripcion,
    });

    NotaModel copyWith({
        String? id,
        String? titulo,
        String? descripcion,
    }) => 
        NotaModel(
            id: id ?? this.id,
            titulo: titulo ?? this.titulo,
            descripcion: descripcion ?? this.descripcion,
        );

    factory NotaModel.fromJson(String str) => NotaModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NotaModel.fromMap(Map<String, dynamic> json) => NotaModel(
        id: json["id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
    };
}
