import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ImagePickerService {  

    static final ImagePickerService _singleton = ImagePickerService._();
    final ImagePicker picker = ImagePicker();
    String pathImageCapture = "";
    String pathVideoCapture = "";
    String pathImagePick = "";
    String pathVideoPick = "";
    VideoPlayerController? videoPlayerControllerPick;
    VideoPlayerController? videoPlayerControllerCapture;
    factory ImagePickerService(){
        return _singleton;
    }
    ImagePickerService._();

    controllerVideoPick()async {
      videoPlayerControllerPick =  VideoPlayerController.file(File(pathVideoPick));
      await videoPlayerControllerPick!.initialize();
    }  
    
    controllerVideoCapture()async {
      videoPlayerControllerCapture =  VideoPlayerController.file(File(pathVideoCapture));
      await videoPlayerControllerCapture!.initialize();
    }  
    
    capturePhoto()async{
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);   
      if (photo != null) {
        pathImageCapture = photo.path;        
      }      
    }

    pickPhoto()async{      
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);    
      if (image != null) {
        pathImagePick =   image.path;        
      }      
      
    }
    pickVideo()async{    
      final XFile? galleryVideo = await picker.pickVideo(source: ImageSource.gallery);
      if (galleryVideo != null) {        
        pathVideoPick = galleryVideo.path;
      }      
    }
    captureVideo()async{                  
      final XFile? cameraVideo = await picker.pickVideo(source: ImageSource.camera);
      if (cameraVideo != null) {
        pathVideoCapture = cameraVideo.path;      
      }
    }

}