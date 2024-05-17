import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  RxString imagepath = ''.obs;

  Future pickImageFromCamera() async {
    final ImagePicker _imagepicker = ImagePicker();
    final returnImage =
        await _imagepicker.pickImage(source: ImageSource.camera);

    if (returnImage != null) {
      imagepath.value = returnImage.path.toString();
    }
  }

  Future pickImageFromGallery() async {
    final ImagePicker imagepicker = ImagePicker();
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage != null) {
      imagepath.value = returnImage.path.toString();
    }
  }
}
