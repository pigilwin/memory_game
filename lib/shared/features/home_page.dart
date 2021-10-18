import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/matcher/matcher.dart';
import 'package:memory_game/range/range.dart';
import 'package:memory_game/shared/components/home_page_button.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: BlocBuilder<RangeBloc, RangeState>(
        builder: (_, state) {
          return BlocBuilder<MatcherBloc, MatcherState>(
            builder: (_, state) {
              return Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: HomePageButton(buttonText: 'Matcher', onPressed: () {
                        context.read<MatcherBloc>().add(InitialiseMatcherGameEvent());
                        Navigator.of(context).pushNamed('/matcher');
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: HomePageButton(buttonText: 'Range', onPressed: () {
                        context.read<RangeBloc>().add(InitialiseRangeGameEvent());
                        Navigator.of(context).pushNamed('/range');
                      }),
                    )
                  ],
                ),
              );
            },
          );
        },
      )
    );
  }
}