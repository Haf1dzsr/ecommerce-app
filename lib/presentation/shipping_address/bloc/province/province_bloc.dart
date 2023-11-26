import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:ecommerce_app/data/models/responses/province_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  ProvinceBloc() : super(const _Initial()) {
    on<_GetAll>(
      (event, emit) async {
        emit(const _Loading());
        final result = await RajaOngkirRemoteDataSource().getProvince();
        result.fold(
          (l) => emit(_Error(l)),
          (r) => emit(
            _Loaded(r.rajaongkir.results),
          ),
        );
      },
    );
  }
}
