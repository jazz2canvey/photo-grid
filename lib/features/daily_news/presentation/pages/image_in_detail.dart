import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_proj/features/daily_news/data/models/image_args.dart';
import 'package:photo_view/photo_view.dart';

class ImageInDetail extends StatefulWidget {

  static const routeName = '/image_in_detail';

  const ImageInDetail({super.key});

  @override
  State<ImageInDetail> createState() => _ImageInDetailState();
}

class _ImageInDetailState extends State<ImageInDetail> with SingleTickerProviderStateMixin {

  late TransformationController transformationController;
  late AnimationController animationController;
  Animation<Matrix4> ? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    transformationController =  TransformationController();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 200))..addListener(() {
      transformationController.value = animation!.value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    transformationController.dispose();
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ImageArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios), color: Colors.black, onPressed: () => Navigator.pop(context),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: InteractiveViewer(
            key: const Key("interactive_viewer"),
          clipBehavior: Clip.none,
            minScale: 1,
            maxScale: 4,
            panEnabled: false,
            transformationController: transformationController,
            onInteractionEnd: (details) {
               resetAnimation();
            },
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: CachedNetworkImage(
                  imageUrl: args.imageURL,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              ),
            )
        ),
      ),
    );
  }

  resetAnimation() {

    animation = Matrix4Tween(

      begin: transformationController.value,
      end: Matrix4.identity(),
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.forward(from: 0);

  }

}
