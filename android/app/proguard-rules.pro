# R8 rules for the release build.
#
# ML Kit's text recognition entry point names all five script bundles it can
# construct — Latin, Chinese, Devanagari, Japanese and Korean — and picks one
# at runtime. This app depends on the Latin bundle only, deliberately: the
# others are tens of megabytes of models for scripts nothing in the capture
# pipeline asks for.
#
# R8 sees the references to the four absent bundles and refuses to shrink,
# which is what stopped `flutter build apk --release` from producing anything
# at all. These are the rules R8 itself generated in
# build/app/outputs/mapping/release/missing_rules.txt.
#
# `-dontwarn` and not `-keep` on purpose. Keeping would be a lie about what is
# in the APK; the classes are genuinely not there, the code path that would
# reach them is never taken, and the honest instruction is "this absence is
# expected".
-dontwarn com.google.mlkit.vision.text.chinese.ChineseTextRecognizerOptions$Builder
-dontwarn com.google.mlkit.vision.text.chinese.ChineseTextRecognizerOptions
-dontwarn com.google.mlkit.vision.text.devanagari.DevanagariTextRecognizerOptions$Builder
-dontwarn com.google.mlkit.vision.text.devanagari.DevanagariTextRecognizerOptions
-dontwarn com.google.mlkit.vision.text.japanese.JapaneseTextRecognizerOptions$Builder
-dontwarn com.google.mlkit.vision.text.japanese.JapaneseTextRecognizerOptions
-dontwarn com.google.mlkit.vision.text.korean.KoreanTextRecognizerOptions$Builder
-dontwarn com.google.mlkit.vision.text.korean.KoreanTextRecognizerOptions
