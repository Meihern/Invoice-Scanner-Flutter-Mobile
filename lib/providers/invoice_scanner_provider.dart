import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_invoice_scanner/models/client_model.dart';
import 'package:mobile_app_invoice_scanner/providers/routes.dart';

class InvoiceScannerProvider{

  Future<File> pickAndPrepareImage(String source) async{
    var file;
    ImagePicker imagePicker = new ImagePicker();
    if (source == "Gallery") file = await imagePicker.getImage(source: ImageSource.gallery);
    if (source == "Camera")  file = await imagePicker.getImage(source: ImageSource.camera);
    File croppedFile = await ImageCropper.cropImage(sourcePath: file.path);
    return croppedFile;
  }

  Future<ClientModel> recognizeClientDetailFromImage(File imageFile) async{
      String uploadImageUrl = UPLOAD_IMG_URL;
      String fileName = imageFile.path.split('/').last;
      var request = http.MultipartRequest('POST', Uri.parse(uploadImageUrl));
      request.files.add(
        http.MultipartFile.fromBytes(
          'uploadedfile',
           imageFile.readAsBytesSync(),
          filename: fileName
        )
      );
      final result = await request.send();
      if (result.statusCode != 200)
        throw Exception();
      else {
        return ClientModel.fromJson(json.decode(await result.stream.bytesToString()));
      }

  }

}

