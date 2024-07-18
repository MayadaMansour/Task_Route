

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../models/Product.dart';


abstract class MainState {}

class MainInitial extends MainState {}

class LoadingHomeData extends MainState {}

class SuccessHomeData extends MainState {
  final List<Products> products;

  SuccessHomeData(this.products);
}

class ErrorHomeData extends MainState {}