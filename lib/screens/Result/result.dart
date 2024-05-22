import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class Result extends StatefulWidget {
  // XFile imageFile;
  XFile imagefile;
  // const Result({Key? key, required this. imagefile}) : super(key: key);
  Result({
    Key? key,
    required this.imagefile,
  }) : super(key: key);

  @override
  _ResultState createState() => _ResultState(imagefile);
}

class _ResultState extends State<Result> {
  List<dynamic>? results;
  Interpreter? interpreter;
  List<String>? labels;
  XFile imagefile;

  _ResultState(this.imagefile);

  @override
  void initState() {
    super.initState();
    loadModelData();
  }

  Future<void> loadModelData() async {
    try {
      // Load the model
      interpreter =
          await Interpreter.fromAsset('assets/model/model_unquant.tflite');

      // Load labels
      final labelData = await rootBundle.loadString('assets/model/labels.txt');
      labels = labelData.split('\n').where((line) => line.isNotEmpty).toList();

      detectDisease();
    } catch (e) {
      print("Failed to load the model: $e");
    }
  }

  Future<void> detectDisease() async {
    var imageBytes = File(widget.imagefile.path).readAsBytesSync();
    var image = img.decodeImage(imageBytes);
    var resized = img.copyResize(image!,
        width: 224, height: 224); // Adjust size as per your model
    var input = imageToByteListFloat32(
        resized, 224, 127.5, 127.5); // Adjust as per your model

    // Update the output tensor shape to match the model's expected output shape
    var output =
        List.filled(6, 0.0).reshape([1, 6]); // Adjust as per your model

    interpreter?.run(input, output);

    setState(() {
      results = output;
    });
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(inputSize * inputSize * 3);
    var buffer = convertedBytes.buffer.asFloat32List();
    int pixelIndex = 0;
    for (int i = 0; i < inputSize; i++) {
      for (int j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = ((img.getRed(pixel) - mean) / std);
        buffer[pixelIndex++] = ((img.getGreen(pixel) - mean) / std);
        buffer[pixelIndex++] = ((img.getBlue(pixel) - mean) / std);
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  int argMax(List<double> list) {
    final maxValue = list.reduce(max);
    return list.indexOf(maxValue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Result Page"),
        ),
        body: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.0001,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            width: MediaQuery.of(context).size.height * 1,
            child: Center(
              child: Image.file(File(widget.imagefile.path)),
              // Image.asset("assets/images/introimage.jpg"),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.0001,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              results == null
                  ? const Text('Image Not Found')
                  : Text(
                      'Disease Detected as : ${labels?[argMax(results![0])]}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
            ],
          )
        ]),
      ),
    );
  }
}
