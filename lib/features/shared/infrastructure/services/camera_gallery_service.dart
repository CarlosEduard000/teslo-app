abstract class CameraGalleryService {
  Future<bool> requestCameraPermission();
  Future<bool> requestGalleryPermission();
  Future<String?> takePhoto();
  Future<String?> selectPhoto();
}
