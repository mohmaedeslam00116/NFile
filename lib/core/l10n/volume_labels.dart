import '../../l10n/app_localizations.dart';
import '../../providers/file_manager_provider.dart';

/// The name of a storage volume, in the language of the application.
///
/// The name of a volume is the name of the device, and the provider holds it
/// as it is. The names the application knows are translated here.
String volumeLabel(AppLocalizations l10n, StorageVolume volume) {
  if (volume.isInternal) return l10n.internalStorage;

  final named = RegExp(r'^SD Card \((.*)\)$').firstMatch(volume.name);
  if (named != null) return '${l10n.sdCard} (${named.group(1)})';

  final usb = RegExp(r'^SD Card / USB \((.*)\)$').firstMatch(volume.name);
  if (usb != null) return '${l10n.sdCard} / USB (${usb.group(1)})';

  if (volume.name == 'SD Card / USB') return '${l10n.sdCard} / USB';

  if (volume.name == 'Documents') return l10n.categoryDocuments;

  return volume.name;
}
