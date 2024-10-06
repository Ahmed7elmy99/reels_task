import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/reels_cubit.dart';
import 'repository/reels_repository.dart';
import 'ui/reels_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => ReelsCubit(ReelsRepository()),
        child: ReelsPage(),
      ),
    );
  }
}
