class AppExceptions implements Exception{
  String? message;
  String? prefix;

  AppExceptions({this.message,this.prefix});

  @override
  String toString() {
    return '$prefix: $message';
  }
}

class FetchDataException extends AppExceptions{
  FetchDataException({message}) : super(message: message,prefix: 'Internet Problem');
}

class BadDataException extends AppExceptions{
  BadDataException({message}) : super(message: message,prefix: 'Invalid Data');
}

class UnathorizedException extends AppExceptions{
  UnathorizedException({message}) : super(message: message,prefix: 'Unathorized');
}

class BadRequestException extends AppExceptions{
  BadRequestException({message}) : super(message: message,prefix: 'Invalid Request');
}