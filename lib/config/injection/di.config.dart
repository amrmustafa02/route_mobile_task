// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:route_mobile_task/core/api/api_manager.dart' as _i3;
import 'package:route_mobile_task/features/post_details/data/data_sources/post_details_data_source.dart'
    as _i4;
import 'package:route_mobile_task/features/post_details/data/data_sources/post_details_remote_source.dart'
    as _i5;
import 'package:route_mobile_task/features/post_details/data/models/comment_model.dart'
    as _i16;
import 'package:route_mobile_task/features/post_details/data/repositories/post_details_data_repo.dart'
    as _i7;
import 'package:route_mobile_task/features/post_details/domain/repositories/posts_details_repo.dart'
    as _i6;
import 'package:route_mobile_task/features/post_details/domain/use_cases/post_details_use_case.dart'
    as _i17;
import 'package:route_mobile_task/features/post_details/domain/use_cases/use_case.dart'
    as _i15;
import 'package:route_mobile_task/features/post_details/presentation/cubit/posts_details_cubit.dart'
    as _i19;
import 'package:route_mobile_task/features/posts/data/data_sources/posts_data_source.dart'
    as _i8;
import 'package:route_mobile_task/features/posts/data/data_sources/posts_remote_data_source.dart'
    as _i9;
import 'package:route_mobile_task/features/posts/data/repositories/posts_data_repo.dart'
    as _i11;
import 'package:route_mobile_task/features/posts/domain/entities/post_entity.dart'
    as _i13;
import 'package:route_mobile_task/features/posts/domain/repositories/posts_repo.dart'
    as _i10;
import 'package:route_mobile_task/features/posts/domain/use_cases/posts_use_case.dart'
    as _i14;
import 'package:route_mobile_task/features/posts/domain/use_cases/use_case.dart'
    as _i12;
import 'package:route_mobile_task/features/posts/presentation/cubit/posts_cubit.dart'
    as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.lazySingleton<_i4.PostDetailsDataSource>(
        () => _i5.PostDetailsRemoteSource(gh<_i3.ApiManager>()));
    gh.lazySingleton<_i6.PostDetailsRepo>(
        () => _i7.PostDetailsDataRepo(gh<_i4.PostDetailsDataSource>()));
    gh.lazySingleton<_i8.PostsDataSource>(
        () => _i9.PostsRemoteDataSource(gh<_i3.ApiManager>()));
    gh.lazySingleton<_i10.PostsRepo>(
        () => _i11.PostsDataRepo(gh<_i8.PostsDataSource>()));
    gh.lazySingleton<_i12.UseCase<List<_i13.PostEntity>>>(
        () => _i14.PostsUseCase(gh<_i10.PostsRepo>()));
    gh.lazySingleton<_i15.UseCase<List<_i16.CommentModel>>>(
        () => _i17.PostDetailsUseCase(gh<_i6.PostDetailsRepo>()));
    gh.lazySingleton<_i18.PostsCubit>(() =>
        _i18.PostsCubit(useCase: gh<_i12.UseCase<List<_i13.PostEntity>>>()));
    gh.factory<_i19.PostsDetailsCubit>(() =>
        _i19.PostsDetailsCubit(gh<_i15.UseCase<List<_i16.CommentModel>>>()));
    return this;
  }
}
