import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/google_sign/models/usuario_google_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignService {  
  static final GoogleSignIn _googleSignIn = GoogleSignIn(  
    scopes: ['email'],
  );
  UsuarioGoogleModel usuarioSelect = UsuarioGoogleModel(nombre: "", correo: "", photoUrl: "");

  Future<UsuarioGoogleModel> signGoogle()async{    
     GoogleSignInAccount? account = await _googleSignIn.signIn();
     if (account != null) {       
     usuarioSelect = UsuarioGoogleModel(
      nombre: account.displayName!, 
      correo: account.email, 
      photoUrl: account.photoUrl);         
     }else{
      usuarioSelect = UsuarioGoogleModel(nombre: "", correo: "", photoUrl: "");
     }

    return usuarioSelect;
  }

  signOutGoogle()async{
     await _googleSignIn.signOut();
     usuarioSelect = UsuarioGoogleModel(nombre: "", correo: "", photoUrl: "");
  }

  Future<bool> boolGoogle()async {
    bool resp = false;
    try {
      resp = await _googleSignIn.isSignedIn();
      return resp;
    } catch (e) {
      print(e); 
    }
    return resp;
  }
}