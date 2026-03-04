// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ExploreState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)
    success,
    required TResult Function(ErrorHandler errorHandler) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult? Function(ErrorHandler errorHandler)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult Function(ErrorHandler errorHandler)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExploreLoading value) loading,
    required TResult Function(ExploreSuccess value) success,
    required TResult Function(ExploreError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExploreLoading value)? loading,
    TResult? Function(ExploreSuccess value)? success,
    TResult? Function(ExploreError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExploreLoading value)? loading,
    TResult Function(ExploreSuccess value)? success,
    TResult Function(ExploreError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExploreStateCopyWith<$Res> {
  factory $ExploreStateCopyWith(
    ExploreState value,
    $Res Function(ExploreState) then,
  ) = _$ExploreStateCopyWithImpl<$Res, ExploreState>;
}

/// @nodoc
class _$ExploreStateCopyWithImpl<$Res, $Val extends ExploreState>
    implements $ExploreStateCopyWith<$Res> {
  _$ExploreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ExploreStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ExploreState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)
    success,
    required TResult Function(ErrorHandler errorHandler) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult? Function(ErrorHandler errorHandler)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult Function(ErrorHandler errorHandler)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExploreLoading value) loading,
    required TResult Function(ExploreSuccess value) success,
    required TResult Function(ExploreError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExploreLoading value)? loading,
    TResult? Function(ExploreSuccess value)? success,
    TResult? Function(ExploreError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExploreLoading value)? loading,
    TResult Function(ExploreSuccess value)? success,
    TResult Function(ExploreError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ExploreState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ExploreLoadingImplCopyWith<$Res> {
  factory _$$ExploreLoadingImplCopyWith(
    _$ExploreLoadingImpl value,
    $Res Function(_$ExploreLoadingImpl) then,
  ) = __$$ExploreLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExploreLoadingImplCopyWithImpl<$Res>
    extends _$ExploreStateCopyWithImpl<$Res, _$ExploreLoadingImpl>
    implements _$$ExploreLoadingImplCopyWith<$Res> {
  __$$ExploreLoadingImplCopyWithImpl(
    _$ExploreLoadingImpl _value,
    $Res Function(_$ExploreLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ExploreLoadingImpl implements ExploreLoading {
  const _$ExploreLoadingImpl();

  @override
  String toString() {
    return 'ExploreState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExploreLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)
    success,
    required TResult Function(ErrorHandler errorHandler) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult? Function(ErrorHandler errorHandler)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult Function(ErrorHandler errorHandler)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExploreLoading value) loading,
    required TResult Function(ExploreSuccess value) success,
    required TResult Function(ExploreError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExploreLoading value)? loading,
    TResult? Function(ExploreSuccess value)? success,
    TResult? Function(ExploreError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExploreLoading value)? loading,
    TResult Function(ExploreSuccess value)? success,
    TResult Function(ExploreError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ExploreLoading implements ExploreState {
  const factory ExploreLoading() = _$ExploreLoadingImpl;
}

/// @nodoc
abstract class _$$ExploreSuccessImplCopyWith<$Res> {
  factory _$$ExploreSuccessImplCopyWith(
    _$ExploreSuccessImpl value,
    $Res Function(_$ExploreSuccessImpl) then,
  ) = __$$ExploreSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AllDoctorsResponseModel allDoctorsResponseModel});
}

/// @nodoc
class __$$ExploreSuccessImplCopyWithImpl<$Res>
    extends _$ExploreStateCopyWithImpl<$Res, _$ExploreSuccessImpl>
    implements _$$ExploreSuccessImplCopyWith<$Res> {
  __$$ExploreSuccessImplCopyWithImpl(
    _$ExploreSuccessImpl _value,
    $Res Function(_$ExploreSuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? allDoctorsResponseModel = null}) {
    return _then(
      _$ExploreSuccessImpl(
        null == allDoctorsResponseModel
            ? _value.allDoctorsResponseModel
            : allDoctorsResponseModel // ignore: cast_nullable_to_non_nullable
                as AllDoctorsResponseModel,
      ),
    );
  }
}

/// @nodoc

class _$ExploreSuccessImpl implements ExploreSuccess {
  const _$ExploreSuccessImpl(this.allDoctorsResponseModel);

  @override
  final AllDoctorsResponseModel allDoctorsResponseModel;

  @override
  String toString() {
    return 'ExploreState.success(allDoctorsResponseModel: $allDoctorsResponseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExploreSuccessImpl &&
            (identical(
                  other.allDoctorsResponseModel,
                  allDoctorsResponseModel,
                ) ||
                other.allDoctorsResponseModel == allDoctorsResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, allDoctorsResponseModel);

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExploreSuccessImplCopyWith<_$ExploreSuccessImpl> get copyWith =>
      __$$ExploreSuccessImplCopyWithImpl<_$ExploreSuccessImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)
    success,
    required TResult Function(ErrorHandler errorHandler) error,
  }) {
    return success(allDoctorsResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult? Function(ErrorHandler errorHandler)? error,
  }) {
    return success?.call(allDoctorsResponseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult Function(ErrorHandler errorHandler)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(allDoctorsResponseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExploreLoading value) loading,
    required TResult Function(ExploreSuccess value) success,
    required TResult Function(ExploreError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExploreLoading value)? loading,
    TResult? Function(ExploreSuccess value)? success,
    TResult? Function(ExploreError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExploreLoading value)? loading,
    TResult Function(ExploreSuccess value)? success,
    TResult Function(ExploreError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ExploreSuccess implements ExploreState {
  const factory ExploreSuccess(
    final AllDoctorsResponseModel allDoctorsResponseModel,
  ) = _$ExploreSuccessImpl;

  AllDoctorsResponseModel get allDoctorsResponseModel;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExploreSuccessImplCopyWith<_$ExploreSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExploreErrorImplCopyWith<$Res> {
  factory _$$ExploreErrorImplCopyWith(
    _$ExploreErrorImpl value,
    $Res Function(_$ExploreErrorImpl) then,
  ) = __$$ExploreErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorHandler errorHandler});
}

/// @nodoc
class __$$ExploreErrorImplCopyWithImpl<$Res>
    extends _$ExploreStateCopyWithImpl<$Res, _$ExploreErrorImpl>
    implements _$$ExploreErrorImplCopyWith<$Res> {
  __$$ExploreErrorImplCopyWithImpl(
    _$ExploreErrorImpl _value,
    $Res Function(_$ExploreErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errorHandler = null}) {
    return _then(
      _$ExploreErrorImpl(
        null == errorHandler
            ? _value.errorHandler
            : errorHandler // ignore: cast_nullable_to_non_nullable
                as ErrorHandler,
      ),
    );
  }
}

/// @nodoc

class _$ExploreErrorImpl implements ExploreError {
  const _$ExploreErrorImpl(this.errorHandler);

  @override
  final ErrorHandler errorHandler;

  @override
  String toString() {
    return 'ExploreState.error(errorHandler: $errorHandler)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExploreErrorImpl &&
            (identical(other.errorHandler, errorHandler) ||
                other.errorHandler == errorHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorHandler);

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExploreErrorImplCopyWith<_$ExploreErrorImpl> get copyWith =>
      __$$ExploreErrorImplCopyWithImpl<_$ExploreErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)
    success,
    required TResult Function(ErrorHandler errorHandler) error,
  }) {
    return error(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult? Function(ErrorHandler errorHandler)? error,
  }) {
    return error?.call(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AllDoctorsResponseModel allDoctorsResponseModel)? success,
    TResult Function(ErrorHandler errorHandler)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorHandler);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ExploreLoading value) loading,
    required TResult Function(ExploreSuccess value) success,
    required TResult Function(ExploreError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ExploreLoading value)? loading,
    TResult? Function(ExploreSuccess value)? success,
    TResult? Function(ExploreError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ExploreLoading value)? loading,
    TResult Function(ExploreSuccess value)? success,
    TResult Function(ExploreError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ExploreError implements ExploreState {
  const factory ExploreError(final ErrorHandler errorHandler) =
      _$ExploreErrorImpl;

  ErrorHandler get errorHandler;

  /// Create a copy of ExploreState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExploreErrorImplCopyWith<_$ExploreErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
