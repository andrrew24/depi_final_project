import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(WatchListInitial());
}
