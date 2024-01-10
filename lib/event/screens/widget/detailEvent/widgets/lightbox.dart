import 'dart:ui';

import 'package:flutter/material.dart';

class LightBox extends StatefulWidget {
  const LightBox({
    super.key,
    required this.images,
    this.initialIndex = 0,
    this.blur = 5,
    this.animationType = Curves.easeInOut,
    this.animationDuration = 200,
    this.imageFit = BoxFit.contain,
    this.thumbnailWidth = 50,
    this.thumbnailHeight = 50,
    this.thumbNailBorderSize = 2,
    this.thumbNailBorderRadius = 5,
    this.thumbNailFocusedBorderColor = Colors.blue,
    this.thumbNailUnfocusedBorderColor = Colors.transparent,
    this.thumbNailUnFocusedOpacity = 0.5,
    this.thumbNailFit = BoxFit.cover,
    this.thumbNailGap = const EdgeInsets.symmetric(horizontal: 5),
    this.thumbNailmarginFromBottom = 30,
  });

  final List<String> images;
  final int initialIndex;
  final double blur;
  final Curve animationType;
  final int animationDuration;
  final BoxFit imageFit;
  final double thumbnailWidth;
  final double thumbnailHeight;
  final double thumbNailBorderSize;
  final double thumbNailBorderRadius;
  final Color thumbNailFocusedBorderColor;
  final Color thumbNailUnfocusedBorderColor;
  final double thumbNailUnFocusedOpacity;
  final EdgeInsets thumbNailGap;
  final BoxFit thumbNailFit;
  final double thumbNailmarginFromBottom;

  @override
  State<LightBox> createState() => _LightBoxState();
}

class _LightBoxState extends State<LightBox> {
  late PageController _pageController;
  late ScrollController _thumbnailController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.images.isNotEmpty) {
      _currentIndex = widget.initialIndex;
    }
    _pageController = PageController(initialPage: _currentIndex);
    _thumbnailController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      double targetOffset = widget.initialIndex *
              (widget.thumbnailWidth + widget.thumbNailGap.horizontal) +
          (widget.thumbnailWidth + widget.thumbNailGap.horizontal) / 2;
      double centerOffset = _thumbnailController.position.viewportDimension / 2;
      double offset = targetOffset - centerOffset;

      _thumbnailController.animateTo(
        offset.clamp(0.0, _thumbnailController.position.maxScrollExtent),
        duration: Duration(milliseconds: widget.animationDuration),
        curve: widget.animationType,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _thumbnailController.dispose();
    super.dispose();
  }

  void _previousImage() {
    _goToImage(--_currentIndex > -1 ? _currentIndex : widget.images.length - 1);
  }

  void _nextImage() {
    _goToImage(++_currentIndex > widget.images.length - 1 ? 0 : _currentIndex);
  }

  void _goToImage(int index) {
    if (widget.animationDuration >= 10) {
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: widget.animationDuration),
        curve: widget.animationType,
      );
    } else {
      _pageController.jumpToPage(index);
    }

    double targetOffset =
        index * (widget.thumbnailWidth + widget.thumbNailGap.horizontal) +
            (widget.thumbnailWidth + widget.thumbNailGap.horizontal) / 2;
    double centerOffset = _thumbnailController.position.viewportDimension / 2;
    double offset = targetOffset - centerOffset;

    _thumbnailController.animateTo(
      offset.clamp(0.0, _thumbnailController.position.maxScrollExtent),
      duration: Duration(milliseconds: widget.animationDuration),
      curve: widget.animationType,
    );
  }

  Widget imageWidget(String url) {
    return Image.network(url);
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: GestureDetector(
                    onHorizontalDragEnd: (DragEndDetails details) {
                      if (details.velocity.pixelsPerSecond.dx > 0) {
                        _previousImage();
                      } else if (details.velocity.pixelsPerSecond.dx < 0) {
                        _nextImage();
                      }
                    },
                    child: PageView.builder(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.images.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 350,
                            width: 350,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: InteractiveViewer(
                                child: FittedBox(
                                  child: imageWidget(widget.images[index]),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 400,
                    height: 80,
                    child: ListView.builder(
                      controller: _thumbnailController,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: widget.thumbnailWidth,
                          height: widget.thumbnailHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: _currentIndex == index
                                  ? widget.thumbNailFocusedBorderColor
                                  : widget.thumbNailUnfocusedBorderColor,
                              width: widget.thumbNailBorderSize,
                            ),
                          ),
                          margin: widget.thumbNailGap,
                          child: GestureDetector(
                            onTap: () {
                              _goToImage(index);
                            },
                            child: Opacity(
                              opacity: _currentIndex == index
                                  ? 1
                                  : widget.thumbNailUnFocusedOpacity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: imageWidget(widget.images[index]),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: widget.thumbNailmarginFromBottom)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
