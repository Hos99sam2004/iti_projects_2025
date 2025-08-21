

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_projects/myapps/news/cubit/cubit_state.dart';

class CubitCubit extends Cubit<CubitState> {
  CubitCubit() : super(CubitInitial());
  final Dio dio = Dio();

  
}

