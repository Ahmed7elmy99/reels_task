import 'package:bloc/bloc.dart';
import '../models/reel.dart';
import '../repository/reels_repository.dart';

class ReelsCubit extends Cubit<List<Reel>> {
  final ReelsRepository reelsRepository;

  ReelsCubit(this.reelsRepository) : super([]);

  Future<void> fetchReels() async {
    final reels = await reelsRepository.getReels();
    emit(reels);
  }

  Future<void> fetchMoreReels() async {
    final reels = await reelsRepository.getMoreReels();
    emit([...state, ...reels]);
  }
}
