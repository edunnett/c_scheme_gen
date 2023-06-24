import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';

import 'package:source_gen/source_gen.dart';

import '../annotations.dart';
import 'model_visitor.dart';

class ColorSchemeGenerator
    extends GeneratorForAnnotation<ColorSchemeAnnotation> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(
        visitor); // Visits all the children of element in no particular order.

    final className = '${visitor.className}Extension';

    final classBuffer = StringBuffer();

    classBuffer.writeln('extension $className on ColorScheme {');

    for (final field in visitor.fields.keys) {
      classBuffer.writeln('Color get $field => EncourageColors.$field;');
    }

    classBuffer.writeln('}');

    return classBuffer.toString();
  }
}
