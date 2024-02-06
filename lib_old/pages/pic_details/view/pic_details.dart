import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';

class DetailScreen extends StatefulWidget {
  final String tag;
  final String url;
  final void Function()? onEditPressed;

  const DetailScreen({
    Key? key,
    required this.tag,
    required this.url,
    this.onEditPressed,
  }) : super(key: key);

  static Page<void> page({
    tag,
    url,
    onEditPressed,
  }) =>
      MaterialPage<void>(
          child: DetailScreen(
        tag: tag,
        url: url,
        onEditPressed: onEditPressed,
      ));

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  @override
  void dispose() {
    context.read<HomeBloc>(); //.add(const AppUserSelectPicDetails(false));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: widget.onEditPressed,
          )
        ],
      ),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'profile_img_tag',
            // child: Placeholder(),
            // child: PhotoView(
            //   imageProvider: const CachedNetworkImageProvider(
            //       'picsum.photos/250?image=9',
            //       scale: 1.0), //(widget.url),
            // ),
            child: CachedNetworkImage(
              imageUrl: widget.url,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
