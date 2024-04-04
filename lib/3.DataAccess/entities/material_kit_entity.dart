import 'dart:convert';

class MaterialKitEntity {
    String nombre;
    String routeApp;
    Ejemplos ejemplos;

    MaterialKitEntity({
        required this.nombre,
        required this.routeApp,
        required this.ejemplos,
    });

    MaterialKitEntity copyWith({
        String? nombre,
        String? routeApp,
        Ejemplos? ejemplos,
    }) => 
        MaterialKitEntity(
            nombre: nombre ?? this.nombre,
            routeApp: routeApp ?? this.routeApp,
            ejemplos: ejemplos ?? this.ejemplos,
        );

    factory MaterialKitEntity.fromJson(String str) => MaterialKitEntity.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MaterialKitEntity.fromMap(Map<String, dynamic> json) => MaterialKitEntity(
        nombre: json["nombre"],
        routeApp: json["route_app"],
        ejemplos: Ejemplos.fromMap(json["ejemplos"]),
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "route_app": routeApp,
        "ejemplos": ejemplos.toMap(),
    };
}

class Ejemplos {
    String nombres;
    String routeApp;

    Ejemplos({
        required this.nombres,
        required this.routeApp,
    });

    Ejemplos copyWith({
        String? nombres,
        String? routeApp,
    }) => 
        Ejemplos(
            nombres: nombres ?? this.nombres,
            routeApp: routeApp ?? this.routeApp,
        );

    factory Ejemplos.fromJson(String str) => Ejemplos.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ejemplos.fromMap(Map<String, dynamic> json) => Ejemplos(
        nombres: json["nombres"],
        routeApp: json["route_app"],
    );

    Map<String, dynamic> toMap() => {
        "nombres": nombres,
        "route_app": routeApp,
    };
}


