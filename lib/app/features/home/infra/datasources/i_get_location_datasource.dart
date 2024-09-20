import '../../domain/helpers/params/get_location_params.dart';

abstract class IGetLocationDatasource {
  Future<List<Map<String, dynamic>>> call(GetLocationParams params);
}
