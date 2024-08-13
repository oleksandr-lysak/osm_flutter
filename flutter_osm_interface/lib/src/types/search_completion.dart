import 'geo_point.dart';

class Address {
  final String? postcode;
  final String? name;
  final String? street;
  final String? housenumber;
  final String? city;
  final String? state;
  final String? country;

  Address({
    this.postcode,
    this.street,
    this.housenumber,
    this.city,
    this.name,
    this.state,
    this.country,
  });

  Address.fromPhotonAPI(Map data)
      : this.postcode = data["postcode"],
        this.name = data["name"],
        this.street = data["street"],
        this.housenumber = data["housenumber"],
        this.city = data["city"],
        this.state = data["state"],
        this.country = data["country"];

  @override
  String toString({String separator = ","}) {
    List<String> addr = [];
    if (name != null && name!.isNotEmpty) {
      addr.add(name!);
    }
    if (street != null && street!.isNotEmpty) {
      if (housenumber != null && housenumber!.isNotEmpty) {
        addr.add("$street $housenumber");
      } else {
        addr.add(street!);
      }
    }
    if (postcode != null && postcode!.isNotEmpty) {
      addr.add(postcode!);
    }
    if (city != null && city!.isNotEmpty) {
      addr.add(city!);
    }
    if (state != null && state!.isNotEmpty) {
      addr.add(state!);
    }
    if (country != null && country!.isNotEmpty) {
      addr.add(country!);
    }

    return addr.join(separator);
  }
}

class SearchInfo {
  final GeoPoint? point;
  final Address? address;

  SearchInfo({
    this.point,
    this.address,
  });

  SearchInfo.fromPhotonAPI(Map data)
      : this.point = GeoPoint(
            latitude: data["geometry"]["coordinates"][1],
            longitude: data["geometry"]["coordinates"][0]),
        this.address = Address.fromPhotonAPI(data["properties"]);
}
