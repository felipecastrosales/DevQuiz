import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/home/widgets/score_card/score_card_widget.dart';
import 'package:devquiz/shared/models/user_model.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({
    super.key,
    required this.user,
  }) : super(
          preferredSize: const Size.fromHeight(250),
          child: SizedBox(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    gradient: AppGradients.linear,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Hello, ',
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(user.photoUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0.0, 1.0),
                  child: ScoreCardWidget(
                    percent: user.score / 100,
                  ),
                ),
              ],
            ),
          ),
        );

  final UserModel user;
}
