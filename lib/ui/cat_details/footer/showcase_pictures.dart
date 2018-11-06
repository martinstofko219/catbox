import 'package:flutter/material.dart';

import 'package:catbox/models/cat.dart';

class PicturesShowcase extends StatelessWidget {
  final Cat cat;

  PicturesShowcase(this.cat);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<Image> images = _getCatImages(cat);

    return images.isEmpty
        ? _buildEmptyState(textTheme)
        : _buildImageGrid(images);
  }

  Widget _buildImageGrid(List<Image> images) {
    final SliverGridDelegate delegate =
        SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: images,
    );
  }

  Widget _buildEmptyState(TextTheme textTheme) {
    return Center(
      child: Text(
        'What?! No cat images?',
        style: textTheme.subhead.copyWith(color: Colors.white),
      ),
    );
  }

  List<Image> _getCatImages(Cat cat) {
    final List<Image> images = <Image>[];
    cat.pictures.forEach((String url) {
      var image = Image.network(
        url,
        width: 200.0,
        height: 200.0,
      );
      images.add(image);
    });

    return images;
  }
}
