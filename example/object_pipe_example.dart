import 'package:object_pipe/src/object_pipe_base.dart';

void main() async {
  ObjectPipe<String> pipe = ObjectPipe("Hello");

  pipe.add((object) => "${object}World");

  pipe.add((object) async {
    await Future.delayed(Duration(seconds: 1));
    return "$object!";
  });

  String result = await pipe.execute();
  print(result);
}
