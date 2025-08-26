# object_pipe

A simple, fluent, and type-safe utility for creating processing pipelines for objects in Dart. Chain synchronous and asynchronous operations with ease.

## Features

*   **Fluent API:** Chain multiple processing stages together in a clean, readable way.
*   **Async & Sync Support:** Mix and match synchronous functions and asynchronous `Future`s in your pipeline stages. The pipeline handles them automatically.
*   **Type-Safe:** Uses Dart generics to ensure type safety throughout the pipeline.
*   **Lightweight:** A single, simple class with no external dependencies.

## Usage

The `ObjectPipe` allows you to take an initial object and pass it through a series of "stages". Each stage receives the output of the previous one.

Here's a simple example of transforming a `String`:

```dart
import 'package:object_pipe/object_pipe.dart';

void main() async {
  // 1. Create a pipe with an initial object
  final pipe = ObjectPipe("Hello");

  // 2. Add a synchronous stage to append "World"
  pipe.add((object) => "${object}World");

  // 3. Add an asynchronous stage that waits 1 second and appends "!"
  pipe.add((object) async {
    await Future.delayed(const Duration(seconds: 1));
    return "$object!";
  });

  // 4. Execute the pipeline and await the final result
  final result = await pipe.execute();

  // Prints "HelloWorld!" after a 1-second delay.
  print(result);
}
```
