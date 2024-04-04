import 'dart:convert';

class Ejemplo {
    String nombre;
    String routeApp;
    String urlImage;

    Ejemplo({
        required this.nombre,
        required this.routeApp,
        required this.urlImage,
    });

    Ejemplo copyWith({
        String? nombre,
        String? routeApp,
        String? urlImage,
    }) => 
        Ejemplo(
            nombre: nombre ?? this.nombre,
            routeApp: routeApp ?? this.routeApp,
            urlImage: urlImage ?? this.urlImage,
        );

    factory Ejemplo.fromJson(String str) => Ejemplo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Ejemplo.fromMap(Map<String, dynamic> json) => Ejemplo(
        nombre: json["nombre"],
        routeApp: json["route_app"],
        urlImage: json["url_image"],
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "route_app": routeApp,
        "urlImage": urlImage,
    };
}