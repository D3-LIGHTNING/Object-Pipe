import 'dart:async';

typedef BuilderCallback<T extends Object> = FutureOr<T> Function(T object);

final class ObjectPipe<T extends Object> {
  final List<BuilderCallback<T>> _stages;
  final T object;

  ObjectPipe(this.object) : _stages = <BuilderCallback<T>>[];

  ObjectPipe<T> add(BuilderCallback<T> stage) {
    _stages.add(stage);
    return this;
  }

  Future<T> execute() async {
    T modifiedObject = object;

    for (BuilderCallback<T> builderStage in _stages) {
      modifiedObject = await builderStage(modifiedObject);
    }

    return modifiedObject;
  }
}
