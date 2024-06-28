import 'dart:io';

import 'package:aroom_pro/constants/defaults.dart';
import 'package:aroom_pro/views/dashboard/widgets/add_products_widgets/uplaod_media.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  List<File> _selectedImages = [];

  void _handleImagesSelected(List<File> images) {
    setState(() {
      _selectedImages = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(AppDefaults.padding),
            child:
                UploadMediaContainer(onImagesSelected: _handleImagesSelected),
          ),
        ),
      ],
    );
  }
}
