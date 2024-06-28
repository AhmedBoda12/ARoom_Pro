import 'dart:io';

import 'package:flutter/material.dart';

class UploadMediaContainer extends StatefulWidget {
  const UploadMediaContainer({super.key, required this.onImagesSelected});
  final Function(List<File>) onImagesSelected;

  @override
  State<UploadMediaContainer> createState() => _UploadMediaContainerState();
}

class _UploadMediaContainerState extends State<UploadMediaContainer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
