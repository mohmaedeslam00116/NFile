import '../../models/file_filter_type.dart';
import '../kind.dart';

/// The Kinds a Filter keeps.
///
/// The Filter vocabulary (`FileFilterType`) and the Kind vocabulary (`Kind`) are two
/// vocabularies on purpose: the user asks for "documents", the file is a `text` or a
/// `document`. This is the one place that translates between them.
bool matchesFilter(Set<Kind> kinds, FileFilterType filter) {
  switch (filter) {
    case FileFilterType.all:
      return true;
    case FileFilterType.documents:
      return kinds.contains(Kind.document) || kinds.contains(Kind.text);
    case FileFilterType.images:
      return kinds.contains(Kind.image);
    case FileFilterType.audio:
      return kinds.contains(Kind.audio);
    case FileFilterType.videos:
      return kinds.contains(Kind.video);
    case FileFilterType.archives:
      return kinds.contains(Kind.archive);
  }
}
