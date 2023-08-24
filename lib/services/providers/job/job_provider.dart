import 'package:kampus_gratis/models/penyaluran_kerja/job_detail_model.dart';
import 'package:kampus_gratis/models/penyaluran_kerja/job_models.dart';
import 'package:kampus_gratis/services/repository/job/job_repository.dart';

class JobProvider {
  final JobRepository _jobRepository;
  JobProvider(this._jobRepository);
  Future<List<JobModels>?> getAll(body) async {
    var response = await _jobRepository.allJobs(body);
    return Job.fromJson(response).data;
  }

  Future<DetailJobModel?> getJobDetail(String id) async {
    var response = await _jobRepository.jobDetail(id);
    return DetailJob.fromJson(response).data;
  }
}
