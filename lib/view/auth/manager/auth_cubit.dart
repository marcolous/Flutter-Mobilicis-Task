import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_cubit.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoadig,
    @Default(false) bool termsChecked,
    @Default(0) int currentScreen,
  }) = _AuthState;
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());
  final phoneController = TextEditingController();

  int get index => state.currentScreen;

  int _sheetHeight = 300;
  int get sheetHeight => _sheetHeight;

  String _sheetTitle = 'Sign in to continue';
  String get sheetTitle => _sheetTitle;

  void setSheetTitle(String title) {
    _sheetTitle = title;
  }

  void setSheetHeight(int height) {
    _sheetHeight = height;
  }

  void onTermsChange(bool checked) {
    emit(state.copyWith(termsChecked: checked));
  }

  void updateCurrentScreen(int currentScreen) {
    emit(state.copyWith(currentScreen: currentScreen));
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }
}
