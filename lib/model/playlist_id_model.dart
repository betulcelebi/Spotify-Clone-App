import 'dart:convert';

PlaylistIdResponse PlaylistIdResponseFromJson(String str) =>
    PlaylistIdResponse.fromJson(json.decode(str));

class PlaylistIdResponse {
  PlaylistIdResponse({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  Followers? followers;
  String? href;
  String? id;
  List<PlaylistIdResponseImage>? images;
  String? name;
  Owner? owner;
  String? primaryColor;
  bool? public;
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  factory PlaylistIdResponse.fromJson(Map<String, dynamic> json) =>
      PlaylistIdResponse(
        collaborative:
            json["collaborative"] == null ? null : json["collaborative"],
        description: json["description"] == null ? null : json["description"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        followers: json["followers"] == null
            ? null
            : Followers.fromJson(json["followers"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        images: json["images"] == null
            ? null
            : List<PlaylistIdResponseImage>.from(
                json["images"].map((x) => PlaylistIdResponseImage.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
        primaryColor:
            json["primary_color"] == null ? null : json["primary_color"],
        public: json["public"] == null ? null : json["public"],
        snapshotId: json["snapshot_id"] == null ? null : json["snapshot_id"],
        tracks: json["tracks"] == null ? null : Tracks.fromJson(json["tracks"]),
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );
}

class ExternalUrls {
  ExternalUrls({
    this.spotify,
  });

  String? spotify;

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"] == null ? null : json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify == null ? null : spotify,
      };
}

class Followers {
  Followers({
    this.href,
    this.total,
  });

  dynamic href;
  int? total;

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total == null ? null : total,
      };
}

class PlaylistIdResponseImage {
  PlaylistIdResponseImage({
    this.height,
    this.url,
    this.width,
  });

  dynamic height;
  String? url;
  dynamic width;

  factory PlaylistIdResponseImage.fromJson(Map<String, dynamic> json) =>
      PlaylistIdResponseImage(
        height: json["height"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url == null ? null : url,
        "width": width,
      };
}

class Owner {
  Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  String? displayName;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        displayName: json["display_name"] == null ? null : json["display_name"],
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName == null ? null : displayName,
        "external_urls": externalUrls == null ? null : externalUrls?.toJson(),
        "href": href == null ? null : href,
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "uri": uri == null ? null : uri,
      };
}

class Tracks {
  Tracks({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  String? href;
  List<Item>? items;
  int? limit;
  dynamic next;
  int? offset;
  dynamic previous;
  int? total;

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"] == null ? null : json["href"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        limit: json["limit"] == null ? null : json["limit"],
        next: json["next"],
        offset: json["offset"] == null ? null : json["offset"],
        previous: json["previous"],
        total: json["total"] == null ? null : json["total"],
      );
}

class Item {
  Item({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  String? addedAt;
  AddedBy? addedBy;
  bool? isLocal;
  dynamic primaryColor;
  Track? track;
  VideoThumbnail? videoThumbnail;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        addedAt: json["added_at"] == null ? null : json["added_at"],
        addedBy: json["added_by"] == null
            ? null
            : AddedBy.fromJson(json["added_by"]),
        isLocal: json["is_local"] == null ? null : json["is_local"],
        primaryColor: json["primary_color"],
        track: json["track"] == null ? null : Track.fromJson(json["track"]),
        videoThumbnail: json["video_thumbnail"] == null
            ? null
            : VideoThumbnail.fromJson(json["video_thumbnail"]),
      );
}

class AddedBy {
  AddedBy({
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  factory AddedBy.fromJson(Map<String, dynamic> json) => AddedBy(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls == null ? null : externalUrls?.toJson(),
        "href": href == null ? null : href,
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "uri": uri == null ? null : uri,
      };
}

class Track {
  Track({
    this.album,
    this.artists,
    this.discNumber,
    this.durationMs,
    this.episode,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.isPlayable,
    this.name,
    this.popularity,
    this.previewUrl,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  Album? album;
  List<Artist>? artists;
  int? discNumber;
  int? durationMs;
  bool? episode;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  bool? isPlayable;
  String? name;
  int? popularity;
  String? previewUrl;
  bool? track;
  int? trackNumber;
  String? type;
  String? uri;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        album: json["album"] == null ? null : Album.fromJson(json["album"]),
        artists: json["artists"] == null
            ? null
            : List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        discNumber: json["disc_number"] == null ? null : json["disc_number"],
        durationMs: json["duration_ms"] == null ? null : json["duration_ms"],
        episode: json["episode"] == null ? null : json["episode"],
        explicit: json["explicit"] == null ? null : json["explicit"],
        externalIds: json["external_ids"] == null
            ? null
            : ExternalIds.fromJson(json["external_ids"]),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        isLocal: json["is_local"] == null ? null : json["is_local"],
        isPlayable: json["is_playable"] == null ? null : json["is_playable"],
        name: json["name"] == null ? null : json["name"],
        popularity: json["popularity"] == null ? null : json["popularity"],
        previewUrl: json["preview_url"] == null ? null : json["preview_url"],
        track: json["track"] == null ? null : json["track"],
        trackNumber: json["track_number"] == null ? null : json["track_number"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );
}

class Album {
  Album({
    this.albumType,
    this.artists,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  String? albumType;
  List<Artist>? artists;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<AlbumImage>? images;
  String? name;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json["album_type"] == null ? null : json["album_type"],
        artists: json["artists"] == null
            ? null
            : List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        images: json["images"] == null
            ? null
            : List<AlbumImage>.from(
                json["images"].map((x) => AlbumImage.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        releaseDatePrecision: json["release_date_precision"] == null
            ? null
            : json["release_date_precision"],
        totalTracks: json["total_tracks"] == null ? null : json["total_tracks"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );
}

class Artist {
  Artist({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: json["external_urls"] == null
            ? null
            : ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"] == null ? null : json["href"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
        uri: json["uri"] == null ? null : json["uri"],
      );
}

class AlbumImage {
  AlbumImage({
    this.height,
    this.url,
    this.width,
  });

  int? height;
  String? url;
  int? width;

  factory AlbumImage.fromJson(Map<String, dynamic> json) => AlbumImage(
        height: json["height"] == null ? null : json["height"],
        url: json["url"] == null ? null : json["url"],
        width: json["width"] == null ? null : json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height == null ? null : height,
        "url": url == null ? null : url,
        "width": width == null ? null : width,
      };
}

class ExternalIds {
  ExternalIds({
    this.isrc,
  });

  String? isrc;

  factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        isrc: json["isrc"] == null ? null : json["isrc"],
      );

  Map<String, dynamic> toJson() => {
        "isrc": isrc == null ? null : isrc,
      };
}

class VideoThumbnail {
  VideoThumbnail({
    this.url,
  });

  dynamic url;

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) => VideoThumbnail(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
