import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'camera_gallery_service.dart';

class CameraGalleryServiceImpl extends CameraGalleryService{

  final ImagePicker picker = ImagePicker();

  @override
  Future<bool> requestCameraPermission() async{
    PermissionStatus status = await Permission.camera.status;

    if(!status.isGranted){
      status = await Permission.camera.request();
    }
    return status.isGranted;
  }

  @override
  Future<bool> requestGalleryPermission() async {
    PermissionStatus status = await Permission.photos.status;
    if (!status.isGranted) {
      status = await Permission.photos.request();
    }

    if (!status.isGranted) {
      PermissionStatus storageStatus = await Permission.storage.status;
      if (!storageStatus.isGranted) {
        storageStatus = await Permission.storage.request();
      }
      return storageStatus.isGranted;
    }
    return status.isGranted;
  }

  @override
  Future<String?> selectPhoto() async {    

    final granted = await requestGalleryPermission();
    if (!granted) return null;

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80
    );

    if( image == null) return null;

    print('Tenemos una imagen ${image.path}');
    return image.path;    
  }

  @override
  Future<String?> takePhoto() async{

    final granted = await requestGalleryPermission();
    if (!granted) return null;

    final XFile? photo = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.rear
    );

    if( photo == null) return null;

    print('Tenemos una imagen ${photo.path}');
    return photo.path;
  }    
}