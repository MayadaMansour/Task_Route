import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/Product.dart';
import 'main_state.dart';



class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());


  static MainCubit get(context) => BlocProvider.of(context);
  List<Products>? product;

  void getHomeData() {
    emit(LoadingHomeData());
    Dio().get('https://dummyjson.com/products').then((response) {
      print('Response Data: ${response.data}'); // Log the raw response data

      try {
        var jsonData = response.data;

        // Check if the response contains 'products' key
        if (jsonData is Map<String, dynamic> && jsonData.containsKey('products')) {
          var productsData = jsonData['products'];
          if (productsData is List) {
            List<Products> products = productsData.map((e) => Products.fromJson(e)).toList();
            emit(SuccessHomeData(products));
            print(products);
          } else {
            emit(ErrorHomeData());
            print("Products data is not a list");
          }
        } else {
          emit(ErrorHomeData());
          print("Response does not contain 'products' key or is in unexpected format");
        }
      } catch (e) {
        emit(ErrorHomeData());
        print('Error parsing response: $e');
      }
    }).catchError((error) {
      emit(ErrorHomeData());
      print('Request failed: ${error.toString()}');
    });
  }}
