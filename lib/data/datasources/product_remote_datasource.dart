import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/common/constants/variables.dart';
import 'package:ecommerce_app/data/datasources/auth_local_datasources.dart';
import 'package:ecommerce_app/data/models/responses/products_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  Future<Either<String, ProductsResponseModel>> getAllProduct() async {
    String token = await AuthLocalDataSource().getToken();

    final headers = {
      'Authorization': "Bearer $token",
    };
    final response = await http.get(
        Uri.parse("${Variables.baseUrl}/api/products?populate=*"),
        headers: headers);
    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }
}
