
import 'package:flutter/material.dart';

import '../views/historicos_view.dart';
import '../views/informes_view.dart';
import '../views/mas_view.dart';
import '../views/recordatorios_view.dart';

class SelectView {

 Widget seleccionarView({required int posicion, required Color colorSecundary,required Color colorPrimary}){

    late Widget view; 
              switch (posicion) {
                case 0:
                  view = HistoricosView(
                    items: 10, 
                    colorSecundary: colorSecundary, 
                    colorPrimary: colorPrimary);
                  break;
                case 1:
                  view = const InformesView();
                  break;
                case 2:
                  view = const RecordatorioView();                
                  break;
                default:
                  view = const MasView();                
              }
    return view;
  }

  
}