import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/pages/home/bloc/home_bloc.dart';
import 'package:photo_view/photo_view.dart';

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

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void dispose() {
    context.read<HomeBloc>().add(const AppUserSelectPicDetails(false));
    print('DISPOSE');

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
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(widget.url),
            ),
            // CachedNetworkImage(
            //   imageUrl: widget.url,
            //   errorWidget: Icon(Icons.error),
            // ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
