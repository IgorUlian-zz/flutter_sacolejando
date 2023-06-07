// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowImageCachedNetwork extends StatelessWidget {
  final String _image = '';

  const ShowImageCachedNetwork(String s);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: _image,
        placeholder: (context, url) => const SizedBox(
          height: 80,
          width: 80,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
