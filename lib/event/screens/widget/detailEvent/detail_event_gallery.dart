import 'package:flutter/material.dart';
import 'package:payment_module/event/screens/widget/detailEvent/widgets/lightbox.dart';

class DetailEventGallery extends StatefulWidget {
  const DetailEventGallery({super.key});

  @override
  State<DetailEventGallery> createState() => _DetailEventGalleryState();
}

class _DetailEventGalleryState extends State<DetailEventGallery> {
  final List<String> images = [
    'https://picsum.photos/250?image=10',
    'https://picsum.photos/250?image=13',
    'https://picsum.photos/250?image=15',
    'https://picsum.photos/250?image=10',
    'https://picsum.photos/250?image=13',
    'https://picsum.photos/250?image=15',
    'https://picsum.photos/250?image=10',
    'https://picsum.photos/250?image=13',
    'https://picsum.photos/250?image=15',
    'https://picsum.photos/250?image=10',
    'https://picsum.photos/250?image=13',
    'https://picsum.photos/250?image=15',
    'https://picsum.photos/250?image=10',
  ];

  late int showingImage;

  void _openAnimatedDialog(int index) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 200),
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, widget) {
        return LightBox(
          initialIndex: index,
          images: images,
          thumbNailBorderRadius: 16,
          thumbnailWidth: 80,
          thumbnailHeight: 80,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: images.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return buildGridItem(images[index], index);
          },
        ),
      ],
    );
  }

  Widget buildGridItem(String imageUrl, int index) {
    return GestureDetector(
      onTap: () {
        _openAnimatedDialog(index);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: 150.0,
            height: 150.0,
          ),
        ),
      ),
    );
  }
}
