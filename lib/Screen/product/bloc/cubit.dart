import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:elevate_flutter_advanced_bootcamp/Screen/product/bloc/states.dart';
import 'package:elevate_flutter_advanced_bootcamp/Screen/product/model/AllProductModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitState());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<AllProductModel> products = []; // Change this to a list

  Future<void> fetchProducts() async {
    try {
      emit(ProductGetSourcesLoadingState());
      var uri = Uri.https("fakestoreapi.com", "/products");
      var response = await http.get(uri);

      if (response.statusCode == 200) {
        var jsonList = jsonDecode(response.body) as List; // Ensure it's a list
        products =
            jsonList.map((json) => AllProductModel.fromJson(json)).toList();
        emit(ProductGetSourcesSuccessState());
      } else {
        emit(ProductGetSourcesErrorState());
      }
    } catch (e) {
      emit(ProductGetSourcesErrorState()); // Pass the error message
    }
  }
}
