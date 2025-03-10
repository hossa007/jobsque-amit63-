import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

import '../../../../app_core/widgets/app_bar.dart';
import '../../view_model/job_cubit.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late JobCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=JobCubit.get(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(cubit.selectedOtherFile!
          .path
          .split('/')
          .last, context),
      body: Container(
        color: Colors.white,
          child: PhotoView(
            imageProvider: FileImage(cubit.selectedOtherFile!),
          )
      ),
    );
  }
}
