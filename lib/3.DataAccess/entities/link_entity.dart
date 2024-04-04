import 'dart:convert';

class LinkEntity {
    String linkInternet;
    String linkDetalleApp;
    String linkCodigoApp;

    LinkEntity({
        required this.linkInternet,
        required this.linkDetalleApp,
        required this.linkCodigoApp,
    });

    LinkEntity copyWith({
        String? linkInternet,
        String? linkDetalleApp,
        String? linkCodigoApp,
    }) => 
        LinkEntity(
            linkInternet: linkInternet ?? this.linkInternet,
            linkDetalleApp: linkDetalleApp ?? this.linkDetalleApp,
            linkCodigoApp: linkCodigoApp ?? this.linkCodigoApp,
        );

    factory LinkEntity.fromJson(String str) => LinkEntity.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LinkEntity.fromMap(Map<String, dynamic> json) => LinkEntity(
        linkInternet: json["link_internet"],
        linkDetalleApp: json["link_detalle_app"],
        linkCodigoApp: json["link_codigo_app"],
    );

    Map<String, dynamic> toMap() => {
        "link_internet": linkInternet,
        "link_detalle_app": linkDetalleApp,
        "link_codigo_app": linkCodigoApp,
    };
}
