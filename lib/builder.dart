import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/colorscheme_generator.dart';

Builder generateColorScheme(BuilderOptions options) =>
    SharedPartBuilder([ColorSchemeGenerator()], 'colorscheme_generator');
