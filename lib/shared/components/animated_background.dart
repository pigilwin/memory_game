import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum ColorsTypes { color_1, color_2 }

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {

    final tween = TimelineTween<ColorsTypes>(curve: Curves.bounceInOut);
    tween.addScene(begin: const Duration(seconds: 1), duration: const Duration(seconds: 10))
      .animate(ColorsTypes.color_1, tween: ColorTween(begin: const Color(0xffD38312), end: Colors.lightBlue.shade900))
      .animate(ColorsTypes.color_2, tween: ColorTween(begin: const Color(0xffA83279), end: Colors.blue.shade600));

    return PlayAnimation(
      child: child,
      tween: tween,
      duration: tween.duration,
      builder: (BuildContext context, Widget? widget, TimelineValue<ColorsTypes> animation) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [animation.get(ColorsTypes.color_1), animation.get(ColorsTypes.color_2)],
            )
          ),
          child: widget,
        );
      },
    );
  }
}