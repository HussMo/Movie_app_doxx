
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/utils/utils.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.goHome}) : super(SplashLoading()){
    detrmineLocation();
  }
  final void Function() goHome;

  Future<void> detrmineLocation()async{
    await futureDelayed();
    goHome();
  }
}
