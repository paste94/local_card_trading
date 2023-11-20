import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_card_trading/app/bloc/app_bloc.dart';

class SettingsPhoto extends StatelessWidget {
  const SettingsPhoto({super.key});
  final _avatarSize = 48.0;
  final _buttonSize = 17.0;

  @override
  Widget build(BuildContext context) {
    final User user = context.select((AppBloc bloc) => bloc.state.user);

    return Stack(
      children: [
        CircleAvatar(
          radius: _avatarSize,
          backgroundImage:
              user.photo != null ? NetworkImage(user.photo!) : null,
          child: user.photo == null
              ? Icon(Icons.person_outline, size: _avatarSize)
              : null,
        ),
        Positioned(
          right: 0,
          top: 60,
          child: CircleAvatar(
            radius: _buttonSize,
            backgroundColor: const Color(0xff94d500),
            child: IconButton(
              icon: Icon(
                Icons.camera_alt,
                size: _buttonSize - 2,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }
}
