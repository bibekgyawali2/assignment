import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: 200,
      initialPage: 0,
      indicatorColor: Colors.blue,
      indicatorBackgroundColor: Colors.grey,
      onPageChanged: (value) {},
      autoPlayInterval: 7000,
      isLoop: true,
      children: const [
        Image(
          image: NetworkImage(
              "https://img.freepik.com/free-vector/digital-marketing-concept-with-online-advertising-media-symbols-flat_1284-31958.jpg?size=626&ext=jpg"),
          fit: BoxFit.cover,
        ),
        Image(
          image: NetworkImage(
              "https://img.freepik.com/free-vector/mobile-marketing-isometric-style_23-2148896785.jpg?size=338&ext=jpg"),
          fit: BoxFit.fitHeight,
        ),
        Image(
          image: NetworkImage(
              "https://img.freepik.com/free-vector/digital-marketing-concept-with-online-advertising-media-symbols-flat_1284-31958.jpg?size=626&ext=jpg"),
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
