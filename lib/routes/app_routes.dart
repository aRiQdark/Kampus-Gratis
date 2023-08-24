import 'package:get/get.dart';
import 'package:kampus_gratis/bindings/administrasi/verifikasi_akhir/verifikasi_akhir_binding.dart';
import 'package:kampus_gratis/bindings/acarakampus/acarakampus_binding.dart';
import 'package:kampus_gratis/bindings/app_binding.dart';
import 'package:kampus_gratis/bindings/administrasi/berkas/berkas_binding.dart';
import 'package:kampus_gratis/bindings/administrasi/data_diri/data_diri_binding.dart';
import 'package:kampus_gratis/bindings/administrasi/data_keluarga/data_keluarga_binding.dart';
import 'package:kampus_gratis/bindings/administrasi/jenjang_pendidikan/jenjang_pendidikan_binding.dart';
import 'package:kampus_gratis/bindings/artikel/artikel_binding.dart';
import 'package:kampus_gratis/bindings/discussion_global/discussion_global_bindings.dart';
import 'package:kampus_gratis/bindings/home/beranda_binding.dart';
import 'package:kampus_gratis/bindings/iklan_binding.dart';
import 'package:kampus_gratis/bindings/jobs/job_detail_binding.dart';
import 'package:kampus_gratis/bindings/jobs/jobs_binding.dart';
import 'package:kampus_gratis/bindings/kalender/kalender_binding.dart';
import 'package:kampus_gratis/bindings/login/login_binding.dart';
import 'package:kampus_gratis/bindings/onboarding/onboarding_binding.dart';
import 'package:kampus_gratis/bindings/panduan/panduan_bindings.dart';
import 'package:kampus_gratis/bindings/perencanaan_karir/perencanaan_karir_binding.dart';
import 'package:kampus_gratis/bindings/profil_binding.dart';
import 'package:kampus_gratis/bindings/program/program_binding.dart';
import 'package:kampus_gratis/bindings/silabus/fakultas_binding.dart';
import 'package:kampus_gratis/bindings/scoreboard/scoreboard_binding.dart';
import 'package:kampus_gratis/bindings/silabus/kontrak_krs_bindings.dart';
import 'package:kampus_gratis/bindings/silabus/krs_draft_binding.dart';
import 'package:kampus_gratis/bindings/silabus/upload_khs_binding.dart';
import 'package:kampus_gratis/bindings/studiku/studiku_bindings.dart';
import 'package:kampus_gratis/bindings/register/register_binding.dart';
import 'package:kampus_gratis/bindings/reset_password.dart/reset_password_binding.dart';
import 'package:kampus_gratis/bindings/silabus/silabus_binding.dart';
import 'package:kampus_gratis/bindings/tenggat_penugasan/tenggat_penugasan_binding.dart';
import 'package:kampus_gratis/views/administrasi/view/administrasi_success_view.dart';
import 'package:kampus_gratis/views/administrasi/view/berkas_view.dart';
import 'package:kampus_gratis/views/administrasi/view/data_keluarga_view.dart';
import 'package:kampus_gratis/views/administrasi/view/jenjang_pendidikan_view.dart';
import 'package:kampus_gratis/views/administrasi/view/verifikasi_akhir_view.dart';
import 'package:kampus_gratis/views/AcaraKampus/acara_kampus_view.dart';
import 'package:kampus_gratis/views/AcaraKampus/detail_acara._view.dart';
import 'package:kampus_gratis/views/analitik/analitik_view.dart';
import 'package:kampus_gratis/views/artikel/view/artikel_details_view.dart';
import 'package:kampus_gratis/views/beranda/view/beranda_view.dart';
import 'package:kampus_gratis/views/discussion_global/view/discussion_global_add_view.dart';
import 'package:kampus_gratis/views/discussion_global/view/discussion_global_detail.dart';
import 'package:kampus_gratis/views/grade_transcript/view/grade_transcript_view.dart';
import 'package:kampus_gratis/views/penyaluran_kerja/view/job_details_view.dart';
import 'package:kampus_gratis/views/perencanaan_karir/view/hasil_analisa_view.dart';
import 'package:kampus_gratis/views/perencanaan_karir/view/perencanaan_karir_view.dart';
import 'package:kampus_gratis/views/profil/view/edit_profil_view.dart';
import 'package:kampus_gratis/views/discussion_global/view/discussion_global_view.dart';
import 'package:kampus_gratis/views/kalender/view/kalender_view.dart';
import 'package:kampus_gratis/views/nilai_sertifikat/views/detail_nilai.dart';
import 'package:kampus_gratis/views/panduan/view/panduan_view.dart';
import 'package:kampus_gratis/views/penyaluran_kerja/view/penyaluran_kerja_view.dart';
import 'package:kampus_gratis/views/penyaluran_kerja/view/pilihan_pekerjaan_view.dart';
import 'package:kampus_gratis/views/panduan/view/buku_panduan/buku_panduan_detail.dart';
import 'package:kampus_gratis/views/panduan/view/buku_panduan/buku_panduan_view.dart';
import 'package:kampus_gratis/views/panduan/view/kamus_kg/kamus_aplikasi_view.dart';
import 'package:kampus_gratis/views/panduan/view/kamus_kg/kamus_kg_view.dart';
import 'package:kampus_gratis/views/panduan/view/video_panduan/video_panduan_detail.dart';
import 'package:kampus_gratis/views/panduan/view/video_panduan/video_panduan_view.dart';
import 'package:kampus_gratis/views/program/program_view.dart';
import 'package:kampus_gratis/views/reset_password/view/change_password.dart';

import 'package:kampus_gratis/views/rencana_study/draft_krs_view.dart';
import 'package:kampus_gratis/views/rencana_study/facultas_view.dart';
import 'package:kampus_gratis/views/login/view/login_view.dart';
import 'package:kampus_gratis/views/mylearning/view/mylearning_view.dart';
import 'package:kampus_gratis/views/onboarding/view/onboarding_view.dart';
import 'package:kampus_gratis/views/pengaturan/view/pengaturan_view.dart';
import 'package:kampus_gratis/views/profil/view/profil_view.dart';
import 'package:kampus_gratis/views/register/view/register_view.dart';
import 'package:kampus_gratis/views/reset_password/view/reset_password_view.dart';
import 'package:kampus_gratis/views/rencana_study/detail_major_view.dart';
import 'package:kampus_gratis/views/rencana_study/detail_subject_view.dart';
import 'package:kampus_gratis/views/rencana_study/upload_khs_view.dart';
import 'package:kampus_gratis/views/rencana_study/kontrak_krs_view.dart';
import 'package:kampus_gratis/views/rencana_study/draft_pengajuan_view.dart';
import 'package:kampus_gratis/views/rencana_study/major_view.dart';
import 'package:kampus_gratis/views/studiku/view/discussion/discussion_view.dart';
import 'package:kampus_gratis/views/studiku/view/main_studiku_view.dart';
import 'package:kampus_gratis/views/studiku/view/quiz/history_quiz_view.dart';
import 'package:kampus_gratis/views/studiku/view/quiz/description_quiz.dart';
import 'package:kampus_gratis/views/studiku/view/session/session_view.dart';
import 'package:kampus_gratis/views/studiku/view/modul/video_view.dart';
import 'package:kampus_gratis/views/studiku/view/modul/detail_dokumen.dart';
import 'package:kampus_gratis/views/studiku/view/modul/modul_detail.dart';
import 'package:kampus_gratis/views/studiku/view/modul/modul_view.dart';
import 'package:kampus_gratis/views/studiku/view/quiz/quiz_view.dart';
import 'package:kampus_gratis/views/studiku/view/quiz/see_answer_quiz_view.dart';
import 'package:kampus_gratis/views/scoreboard/score_board_view.dart';
import '../bindings/silabus/detail_jurusan_binding.dart';
import '../bindings/silabus/detail_subject_binding.dart';
import '../bindings/nilai_sertifikat/nilai_binding.dart';
import '../bindings/nilai_sertifikat/sertifikat_binding.dart';
import 'package:kampus_gratis/views/tenggat_penugasan/view/assignment_view.dart';
import '../views/administrasi/view/data_diri_view.dart';
import '../views/artikel/view/artikel_view.dart';
import '../views/nilai_sertifikat/views/detail_sertifikat.dart';
import '../views/nilai_sertifikat/views/list_sertifikat.dart';
import '../views/nilai_sertifikat/views/nilai_sertifikat_view.dart';
import '../views/studiku/view/assignment/assignment_detail_view_new.dart';

class AppRoutes {
  static const onboarding = '/onboarding';
  static const home = '/home';
  static final routes = [
    GetPage(
      name: '/home',
      page: () => const BerandaView(),
      bindings: [
        BerandaBinding(),
        ArtikelBinding(),
        IklanBinding(),
        ProfilBinding(),
        AppBinding()
      ],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/mylearning',
      page: () => const MylearningView(),
      // binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/nilai_sertifikat',
      page: () => const NilaiSertifikatView(),
      transition: Transition.noTransition,
      binding: SertifikatBinding(),
    ),
    GetPage(
      name: '/nilai/list',
      page: () => const RangkumanNilaiView(),
      transition: Transition.noTransition,
      binding: NilaiBinding(),
    ),
    GetPage(
      name: '/sertifikat/list',
      page: () => const ListSertifikatView(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/sertifikat/list/detail',
      page: () => const DetailSertifikatView(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/scoreboard',
      page: () => const ScoreBoardView(),
      transition: Transition.noTransition,
      binding: ScoreBinding(),
    ),
    GetPage(
      name: '/artikel',
      page: () => const Artikel(),
      // binding: HomeBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/artikel-details',
      page: () => const ArtikelDetailsView(),
      binding: ArtikelBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/profil',
      page: () => ProfilView(),
      bindings: [ProfilBinding(), LoginBinding(), AppBinding()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/login',
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/reset-password',
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
      transition: Transition.fade,
    ),
    // GetPage(
    //   name: '/flash-screen',
    //   page: () => const SplashScreenView(),
    //   transition: Transition.fade,
    // ),
    GetPage(
      name: '/analitik',
      page: () => const AnalitikView(),
      // binding: OnboardingBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/pengaturan',
      page: () => const PengaturanView(),
      // binding: OnboardingBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/studiku/main',
      page: () => const MainView(),
      binding: StudikuBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/studiku/session',
      page: () => const SessionView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/studiku/quiz/description',
      page: () => const DescriptionQuizView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/studiku/quiz',
      page: () => const QuizView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    // GetPage(
    //   name: '/studiku/quiz/result',
    //   page: () => const ResultQuizView(),
    //   binding: StudikuBinding(),
    //   transition: Transition.fade,
    // ),
    GetPage(
      name: '/studiku/quiz/seeAnswer',
      page: () => const SeeAnswerQuizView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
        name: '/studiku/quiz/historyQuiz',
        page: () => const HistoryQuizView(),
        binding: StudikuBinding(),
        transition: Transition.fade),
    GetPage(
      name: '/home/assignment',
      page: () => const AssignmentView(),
      binding: TenggatPenugasanBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/studiku/assignment/detail/',
      page: () => AssignmentDetailView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/studiku/discussion',
      page: () => const DiscussionView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    // GetPage(
    //   name: '/studiku/discussion/detail',
    //   page: () => const DiscussionDetailView(),
    //   binding: StudikuBinding(),
    //   transition: Transition.fade,
    // ),
    GetPage(
      name: '/studiku/score-board',
      page: () => const ScoreBoardView(),
      // binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/program',
      page: () => const ProgramView(),
      binding: ProgramBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/studiku/modul',
      page: () => const ModulView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/studiku/modul_detail',
      page: () => const ModulDetailView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/studiku/detail_dokumen',
      page: () => const DetailDokumen(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/studiku/module_video',
      page: () => const VideoStudikuView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
        name: '/fakultas',
        page: () => const FakultasView(),
        binding: FacultyBinding(),
        transition: Transition.fade),
    GetPage(
        name: '/prodi',
        page: () => const MajorView(),
        binding: SilabusBinding(),
        transition: Transition.fade),
    GetPage(
        name: '/detail-jurusan',
        page: () => const DetailMajorView(),
        binding: DetailJurusanBinding(),
        transition: Transition.fade),
    GetPage(
        name: '/detail-matakuliah',
        page: () => const DetailSubjectView(),
        binding: DetailSubjectBinding(),
        transition: Transition.fade),
    GetPage(
        name: '/list-kelas',
        page: () => const KontrakKrsView(),
        binding: KontrakKrsBinding(),
        transition: Transition.fade),
    GetPage(
        name: '/pengajuan-berkas',
        page: () => const DraftPengajuanView(),
        binding: KrsDraftBinding(),
        transition: Transition.fade),
    GetPage(
      name: '/draft-krs',
      page: () => const DraftKrsView(),
      binding: KrsDraftBinding(),
      transition: Transition.fade,
    ),
    GetPage(
        name: '/file',
        page: () => UploadKhsView(),
        binding: UploadKhsBinding(),
        transition: Transition.fade),
    GetPage(
      name: '/administrasi-success',
      page: () => const AdministrasiSuccess(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/data-diri',
      page: () => DataDiriView(),
      binding: DataDiriBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/data-keluarga',
      page: () => DataKeluargaView(),
      binding: DataKeluargaBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/berkas',
      page: () => const BerkasView(),
      binding: BerkasBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/jenjang-pendidikan',
      page: () => const JenjangPendidikanView(),
      binding: JenjangPendidikanBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/verifikasi-akhir',
      page: () => const VerifikasiAkhirView(),
      binding: VerifikasiAkhirBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/panduan',
      page: () => const PanduanView(),
      binding: PanduanBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/profil/edit',
      page: () => EditProfilView(),
      binding: ProfilBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/panduan/video',
      page: () => const VideoPanduan(),
      binding: PanduanBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/panduan/video/detail',
      page: () => const VideoPanduanDetail(),
      binding: PanduanBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/panduan/buku',
      page: () => const BukuPanduan(),
      binding: PanduanBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/panduan/buku/detail',
      page: () => const BukuPanduanDetail(),
      binding: PanduanBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/panduan/kamus_kg',
      page: () => const KamusKGScreen(),
      binding: PanduanBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/panduan/kamus_kg/aplikasi',
      page: () => const KamusAplikasi(),
      binding: PanduanBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/panduan/kamus_kg/kuliah',
      page: () => const KamusAplikasi(),
      binding: PanduanBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/edit-profil',
      page: () => EditProfilView(),
    ),
    GetPage(
      name: '/discussion_global',
      page: () => const DiscussionGlobalView(),
      bindings: [
        DiscussionGlobalBindings(),
        StudikuBinding(),
        ProfilBinding(),
      ],
      transition: Transition.fade,
    ),
    GetPage(
      name: '/studiku/discussion_global/detail',
      page: () => const DiscussionGlobalDetailView(),
      binding: StudikuBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/change-pass',
      page: () => const ChangePasswordView(),
      binding: RegisterBinding(),
      transition: Transition.fade,
    ),

    GetPage(
      name: '/penyaluran-kerja',
      page: () => const PenyaluranKerjaView(),
      // binding: JobsBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/pilihan-pekerjaan',
      page: () => const PilihanPekerjaanView(),
      binding: JobsBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/lowongan-kerja',
      page: () => const JobDetailsView(),
      binding: JobDetailBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/transkrip-nilai',
      page: () => const GradeTranscriptView(),
      //binding: PanduanBindings(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/perencanaan-karir',
      page: () => const PerencanaanKarirView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/perencanaan-karir/hasil',
      page: () => const HasilAnalisaView(),
      binding: PerencanaanKarirBinding(),
    ),
    GetPage(
      name: '/Acara-kampus',
      page: () => const AcaraKampusView(),
      binding: AcaraBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/detail-acara',
      page: () => const DetailAcaraView(),
      binding: AcaraBinding(),
      transition: Transition.fade,
    ),

    GetPage(
      name: '/Kalender-saya',
      page: () => const KalenderView(),
      binding: KalenderBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: '/discussion_global/add',
      page: () => const DiscussionGlobalAddView(),
      binding: DiscussionGlobalBindings(),
      transition: Transition.leftToRightWithFade,
    )
  ];
}
