import 'utils.dart';

/// The Kind of an Entry — what it is, for the user's benefit.
///
/// One vocabulary for the whole application: the Kinds of a file are decided here
/// and nowhere else, so two places cannot disagree about the same file.
/// See `CONTEXT.md`.
enum Kind { image, video, audio, document, archive, text, other }

/// The document formats that are documents rather than text.
///
/// `.txt` and `.csv` are text, and a Filter of documents keeps text too.
const _documentExtensions = [
  '.pdf',
  '.doc',
  '.docx',
  '.xls',
  '.xlsx',
  '.ppt',
  '.pptx',
  '.odt',
  '.ods',
  '.odp',
  '.rtf',
  '.epub',
];

/// The Kinds of the file at [path].
///
/// A file may answer to more than one Kind: `app.ts` is code, and it is also a
/// transport stream. The rules that decide them are the rules the application has
/// always used, so a file lands in exactly the Filters it landed in before —
/// the Kind vocabulary replaces the scattered copies, it does not re-judge them.
Set<Kind> kindsOf(String path) {
  final kinds = <Kind>{};

  if (FileUtils.isArchive(path)) kinds.add(Kind.archive);
  if (FileUtils.isImage(path)) kinds.add(Kind.image);
  if (FileUtils.isVideo(path)) kinds.add(Kind.video);
  if (FileUtils.isAudio(path)) kinds.add(Kind.audio);
  if (FileUtils.isTextOrCode(path)) kinds.add(Kind.text);
  if (_documentExtensions.any((ext) => path.toLowerCase().endsWith(ext))) {
    kinds.add(Kind.document);
  }

  if (kinds.isEmpty) kinds.add(Kind.other);
  return kinds;
}
