import 'listing.dart';
import 'listing_builder.dart';
import 'listing_inputs.dart';

/// Remembers the Listing built from a set of inputs, and hands it back when the
/// same inputs come round again.
///
/// The cache is keyed by the inputs and not by the order of the calls, so a change
/// the caller forgot to announce still shows up.
class ListingCache {
  final ListingBuilder _builder;
  final Map<String, _CachedListing> _cached = {};

  ListingCache({ListingBuilder builder = const ListingBuilder()})
      : _builder = builder;

  /// The Listing of [key] with [inputs], built again only when the inputs changed.
  Listing listingFor(String key, ListingInputs inputs) {
    final cached = _cached[key];
    if (cached != null && cached.inputs == inputs) return cached.listing;

    final listing = _builder.build(
      entries: inputs.entries,
      scope: inputs.scope,
      sortRule: inputs.sortRule,
      folderOverrides: inputs.folderOverrides,
      filter: inputs.filter,
      showHiddenFiles: inputs.showHiddenFiles,
      showFoldersInFilter: inputs.showFoldersInFilter,
      pinnedPaths: inputs.pinnedPaths,
    );

    _cached[key] = _CachedListing(inputs, listing);
    return listing;
  }
}

class _CachedListing {
  final ListingInputs inputs;
  final Listing listing;

  const _CachedListing(this.inputs, this.listing);
}
