import 'package:validators/validators.dart';

Function validateUsername() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'User Name을 입력하세요.';
    } else if (!isAlphanumeric(value)) {
      return '영문만 가능합니다.';
    } else if (value.length > 15) {
      return '15자 이상 초과하였습니다.';
    } else if (value.length < 4) {
      return '4자 이상 입력바랍니다.';
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'Password을 입력하세요.';
    } else if (value.length > 15) {
      return '15자 이하로 입력바랍니다.';
    } else if (value.length < 4) {
      return '4자 이상 입력바랍니다.';
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return 'User Email을 입력하세요.';
    } else if (!isEmail(value)) {
      return '이메일 형식에 맞지 않습니다.';
    } else {
      return null;
    }
  };
}

Function validateWriteTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return '제목을 입력하세요.';
    } else {
      return null;
    }
  };
}

Function validateWriteContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return '내용을 입력하세요.';
    } else {
      return null;
    }
  };
}

/*
Function validate() {
    return (String? value){
    if(value!.isEmpty){
      return 'User Name을 입력하세요.';
    }else if(!isAlpha(value)) {
      return 'User Name에 영문만 가능합니다.';
    }else if(value.length > 15) {
      return 'User name 15자 이상 초과하였습니다.';
    }else {
      return null;
    }
  };
}*/
