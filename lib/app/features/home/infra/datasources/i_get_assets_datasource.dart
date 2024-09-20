import '../../domain/helpers/params/get_assets_params.dart';

abstract class IGetAssetsDatasource {
  Future<List<Map<String, dynamic>>> call(GetAssetsParams params);
}
