import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/reels_cubit.dart';
import '../models/reel.dart';
import 'reel_player.dart';

class ReelsPage extends StatefulWidget {
  @override
  _ReelsPageState createState() => _ReelsPageState();
}
class _ReelsPageState extends State<ReelsPage> {
  final PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    context.read<ReelsCubit>().fetchReels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReelsCubit, List<Reel>>(
        builder: (context, reels) {
          if (reels.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: reels.length,
            itemBuilder: (context, index) {
              return ReelPlayer(reel: reels[index]);
            },
            onPageChanged: (index) {
              if (index == reels.length - 1) {
                context.read<ReelsCubit>().fetchMoreReels();
              }
            },
          );
        },
      ),
    );
  }
}
