import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImageLoader {
  static final Map cachedURL = {};

  Future getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    if (cachedURL[imgName] != null) {
      return cachedURL[imgName];
    }

    try {
      cachedURL[imgName] = await FirebaseStorage.instance
          .ref()
          .child("special")
          .child('$imgName.jpg')
          .getDownloadURL();

      return cachedURL[imgName];
    } catch (e) {
      return null;
    }
  }
}
