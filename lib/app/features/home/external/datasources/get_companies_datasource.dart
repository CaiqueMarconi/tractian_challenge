import 'package:model/app/core/shared/services/http_Service/helpers/params/http_param.dart';
import 'package:model/app/core/shared/services/http_Service/i_http_service.dart';
import 'package:model/app/features/home/external/mappers/company_mapper.dart';

import '../../domain/entities/company_entity.dart';
import '../../infra/datasources/i_get_companies_datasource.dart';

class GetCompaniesDatasource implements IGetCompaniesDatasource {
  final IHttpService _httpService;

  GetCompaniesDatasource({
    required IHttpService httpService,
  }) : _httpService = httpService;

  @override
  Future<List<CompanyEntity>> call() async {
    final data = await _httpService.get(
      HttpParam(
        url: 'https://fake-api.tractian.com/companies',
      ),
    );
    final list = List.from(data.response);
    return list.map((json) => CompanieMapper.fromMap(json)).toList();
  }
}
