import 'dart:convert';

import 'package:flutter_full_ux_ix/3.DataAccess/entities/ejemplo_entity.dart';
import 'package:flutter_full_ux_ix/3.DataAccess/entities/link_entity.dart';

class ElementoEntity {
    LinkEntity links;
    String nombre;
    bool actualizado;
    bool creado;
    String descripcion;
    EjemploEntity ejemplos;

    ElementoEntity({
        required this.links,
        required this.nombre,
        required this.actualizado,
        required this.creado,
        required this.descripcion,
        required this.ejemplos,
    });

        ElementoEntity copyWith({
        LinkEntity? links,
        String? nombre,
        bool? actualizado,
        bool? creado,
        String? descripcion,
        EjemploEntity? ejemplos,
    }) => 
        ElementoEntity(
            links: this.links,
            nombre: nombre ?? this.nombre,
            actualizado: actualizado ?? this.actualizado,
            creado: creado ?? this.creado,
            descripcion: descripcion ?? this.descripcion,
            ejemplos: ejemplos ?? this.ejemplos,
        );

    factory ElementoEntity.fromJson(String str) => ElementoEntity.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ElementoEntity.fromMap(Map<String, dynamic> json) => ElementoEntity(
        links: json["links"],
        nombre: json["nombre"],
        actualizado: json["actualizado"],
        creado: json["creado"],
        descripcion: json["descripcion"],
        ejemplos: json["ejemplos"],
    );

    Map<String, dynamic> toMap() => {
        "links": links,
        "nombre": nombre,
        "actualizado": actualizado,
        "creado": creado,
        "descripcion": descripcion,
        "ejemplos": ejemplos,
    };
}
