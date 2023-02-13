class AcomodationModel {
  final String? acomodationPoster;
  final List<String>? acomodationImages;
  final String? acomodationName;
  final String? acomodationRating;
  final String? acomodationPrice;
  final String? acomodationDescription;
  final String? acomodationAddress;
  final bool? acomodationIsAddFavorite;

  AcomodationModel(
      {this.acomodationPoster,
      this.acomodationImages,
      this.acomodationName,
      this.acomodationRating,
      this.acomodationPrice,
      this.acomodationDescription,
      this.acomodationAddress,
      this.acomodationIsAddFavorite});
}

const dirAssetAcomodation = 'assets/img/acomodation';
List<AcomodationModel> dataAcomodation = [
  AcomodationModel(
    acomodationPoster: '$dirAssetAcomodation/img1.jpg',
    acomodationImages: [
      '$dirAssetAcomodation/img1.jpg',
      '$dirAssetAcomodation/img3.jpg',
    ],
    acomodationName: 'Millennium Mitsui Garden Hotel Tokyo',
    acomodationAddress: '5-11-1 Ginza, Chuo-ku, Ginza, Tokyo, Chuo, Japan',
    acomodationDescription:
        'Millennium Mitsui Garden Hotel Tokyo is a hotel in a good neighborhood, which is located at Ginza.\nThe hotel has a very good location, also near the Haneda International Airport (HND), which is only 13.14 km away.\nThe hotel is located only 3.28 km away from Ochanomizu Station.',
    acomodationPrice: 'Rp. 3.800.000',
    acomodationRating: '4.7',
    acomodationIsAddFavorite: true,
  ),
  AcomodationModel(
    acomodationPoster: '$dirAssetAcomodation/img2.jpg',
    acomodationImages: [
      '$dirAssetAcomodation/img2.jpg',
      '$dirAssetAcomodation/img4.jpg',
      '$dirAssetAcomodation/img9.jpg',
    ],
    acomodationName: 'Midtown Residence Marvell City Surabaya',
    acomodationAddress:
        'Jalan Ngagel Raya No 123, Wonokromo, Surabaya, Jawa Timur, Indonesia, 60246',
    acomodationDescription:
        'Midtown Residence Marvell City Surabaya is a hotel in a good neighborhood, which is located at Wonokromo.'
        'The hotel has a very good location, also near the Juanda International Airport (SUB), which is only 11.09 km away.'
        'The hotel is located only 8.35 km away from Sepanjang Station.'
        'Not only well positioned, but Midtown Residence Marvell City Surabaya is also one of hotels near the following Ciputra Water Park within 12.4 km and Mojokerto Station within 39.96 km.',
    acomodationPrice: 'Rp. 760.000',
    acomodationRating: '4.5',
    acomodationIsAddFavorite: false,
  ),
  AcomodationModel(
    acomodationPoster: '$dirAssetAcomodation/img3.jpg',
    acomodationImages: [
      '$dirAssetAcomodation/img3.jpg',
      '$dirAssetAcomodation/img7.jpg',
      '$dirAssetAcomodation/img5.jpg',
    ],
    acomodationName: 'Merlynn Park Hotel',
    acomodationAddress:
        'Jl. K.H.Hasyim Ashari 29-31, Gambir, Petojo Utara, Jakarta, Indonesia, 10130',
    acomodationDescription:
        'Merlynn Park Hotel is a hotel in a good neighborhood, which is located at North Petojo.'
        'The hotel has a very good location, also near the Halim Perdanakusuma International Airport (HLP), which is only 13.97 km away.'
        'The hotel is located only 4.99 km away from Palmerah Station.'
        'Not only well positioned, but Merlynn Park Hotel is also one of hotels near the following Forestry Museum within 4.89 km and Gelora Bung Karno Stadium within 6.05 km.',
    acomodationPrice: 'Rp. 930.000',
    acomodationRating: '4.8',
    acomodationIsAddFavorite: false,
  ),
  AcomodationModel(
    acomodationPoster: '$dirAssetAcomodation/img4.jpg',
    acomodationImages: [
      '$dirAssetAcomodation/img4.jpg',
      '$dirAssetAcomodation/img1.jpg',
      '$dirAssetAcomodation/img8.jpg',
    ],
    acomodationName: 'Sunlake Waterfront Resort & Convention',
    acomodationAddress:
        'Jl. Danau Permai Raya Blok C 1, Sunter, Kelapa Gading, Jakarta, Indonesia, 14350, Sunter, Tanjung Priok, Jakarta, Indonesia, 14350',
    acomodationDescription:
        'Sunlake Waterfront Resort & Convention is located in area / city Sunter.'
        'The hotel is located only 8.01 km away from Bundaran HI MRT Station.'
        'There are plenty of tourist attractions nearby, such as Karawang International Golf Club within 46.76 km, and Sedana Golf Course within 49.88 km.',
    acomodationPrice: 'Rp. 650.000',
    acomodationRating: '4.8',
    acomodationIsAddFavorite: false,
  ),
  AcomodationModel(
    acomodationPoster: '$dirAssetAcomodation/img5.jpg',
    acomodationImages: [
      '$dirAssetAcomodation/img5.jpg',
      '$dirAssetAcomodation/img6.jpg',
      '$dirAssetAcomodation/img10.jpg',
    ],
    acomodationName: 'Best Western Premier The Hive',
    acomodationAddress:
        'Jl. DI Panjaitan Kav. 3 - 4, Cawang, Kramat Jati, Jakarta, Indonesia, 13340',
    acomodationDescription:
        'Best Western Premier The Hive is located in area / city Cawang.'
        'The hotel is located only 2.5 km away from Duren Kalibata Station.'
        'There are plenty of tourist attractions nearby, such as Masjid Al-Ikhlash within 9.28 km, and Karaoke Cafe Bar SAOCLUB within 17.36 km.',
    acomodationPrice: 'Rp. 750.000',
    acomodationRating: '4.9',
    acomodationIsAddFavorite: true,
  ),
];
