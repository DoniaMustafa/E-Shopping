import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'single_product_state.dart';

class SingleProductCubit extends Cubit<SingleProductState> {
  SingleProductCubit() : super(SingleProductInitial());
}
