import 'dart:convert';

class EjemploEntity {
    String nombres;
    String ejemplos;

    EjemploEntity({
        required this.nombres,
        required this.ejemplos,
    });

    factory EjemploEntity.fromJson(String str) => EjemploEntity.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EjemploEntity.fromMap(Map<dynamic, dynamic> json) => EjemploEntity(
        nombres: json["nombres"],
        ejemplos: json["ejemplos"],
    );

    Map<String, dynamic> toMap() => {
        "nombres": nombres,
        "ejemplos": ejemplos,
    };
}
