import 'dart:convert';

class ContenidosViewModel {
    List<dynamic> uiScreen;
    List<dynamic> integrationPub;
    List<dynamic> fullApplication;
    List<dynamic> listAnimation;
    List<dynamic> materialKit;

    ContenidosViewModel({
        required this.uiScreen,
        required this.integrationPub,
        required this.fullApplication,
        required this.listAnimation,
        required this.materialKit,
    });

    ContenidosViewModel copyWith({
        List<dynamic>? uiScreen,
        List<dynamic>? integrationPub,
        List<dynamic>? fullApplication,
        List<dynamic>? listAnimation,
        List<dynamic>? materialKit,
    }) => 
        ContenidosViewModel(
            uiScreen: uiScreen ?? this.uiScreen,
            integrationPub: integrationPub ?? this.integrationPub,
            fullApplication: fullApplication ?? this.fullApplication,
            listAnimation: listAnimation ?? this.listAnimation,
            materialKit: materialKit ?? this.materialKit,
        );

    factory ContenidosViewModel.fromJson(String str) => ContenidosViewModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ContenidosViewModel.fromMap(Map<String, dynamic> json) => ContenidosViewModel(
        uiScreen: List<dynamic>.from(json["ui_screen"].map((x) => x)),
        integrationPub: List<dynamic>.from(json["integration_pub"].map((x) => x)),
        fullApplication: List<dynamic>.from(json["full_application"].map((x) => x)),
        listAnimation: List<dynamic>.from(json["list_animation"].map((x) => x)),
        materialKit: List<dynamic>.from(json["material_kit"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "ui_screen": List<dynamic>.from(uiScreen.map((x) => x)),
        "integration_pub": List<dynamic>.from(integrationPub.map((x) => x)),
        "full_application": List<dynamic>.from(fullApplication.map((x) => x)),
        "list_animation": List<dynamic>.from(listAnimation.map((x) => x)),
        "material_kit": List<dynamic>.from(materialKit.map((x) => x)),
    };
}
