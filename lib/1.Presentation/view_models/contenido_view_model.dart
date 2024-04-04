import 'dart:convert';

import 'package:flutter_full_ux_ix/1.Presentation/view_models/view_models.dart';

class ContenidoViewModel {
    String nombre;
    String routeApp;
    String urlImage;
    List<Ejemplo> ejemplos;

    ContenidoViewModel({
        required this.nombre,
        required this.routeApp,
        required this.ejemplos,
        required this.urlImage,
    });

    ContenidoViewModel copyWith({
        String? nombre,
        String? routeApp,
        String? urlImage,        
        List<Ejemplo>? ejemplos,
    }) => 
        ContenidoViewModel(
            nombre: nombre ?? this.nombre,
            routeApp: routeApp ?? this.routeApp,
            urlImage: urlImage ?? this.urlImage,
            ejemplos: ejemplos ?? this.ejemplos,
        );

    factory ContenidoViewModel.fromJson(String str) => ContenidoViewModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContenidoViewModel.fromMap(Map<String, dynamic> json) => ContenidoViewModel(
        nombre: json["nombre"],
        routeApp: json["route_app"],
        urlImage: json["url_image"],
        ejemplos: List<Ejemplo>.from(json["ejemplos"].map((x) => Ejemplo.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "route_app": routeApp,
        "url_image": urlImage,
        "ejemplos": List<Ejemplo>.from(ejemplos.map((x) => x.toMap())),
    };
}


