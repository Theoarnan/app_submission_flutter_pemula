class TravelAccomodationModel {
  final String? nameTravel;
  final String? dateEvent;
  final String? imgOwner;
  final String? posterTravel;

  TravelAccomodationModel({
    this.nameTravel,
    this.dateEvent,
    this.imgOwner,
    this.posterTravel,
  });
}

List<TravelAccomodationModel> dataTravelAcomodation = [
  TravelAccomodationModel(
      nameTravel: 'Holidays Sprint - Go Travel',
      dateEvent: '20 Mar 2023',
      imgOwner:
          'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg',
      posterTravel:
          'https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/bali-nusa-tenggara/west-nusa-tenggara/lombok/lombok1.jpg'),
  TravelAccomodationModel(
      nameTravel: 'Bali Calling - Start your journey',
      dateEvent: '10 Jun 2023',
      imgOwner:
          'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      posterTravel:
          'https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/bali-nusa-tenggara/west-nusa-tenggara/lombok/lombok2.jpg'),
  TravelAccomodationModel(
      nameTravel: 'Singapore Pack - Modern City',
      dateEvent: '1 Nov 2023',
      imgOwner:
          'https://images.pexels.com/photos/1212984/pexels-photo-1212984.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      posterTravel:
          'https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/bali-nusa-tenggara/west-nusa-tenggara/lombok/lombok3.jpg'),
  TravelAccomodationModel(
      nameTravel: 'MotoGP Lombok - Fast and Beautiful',
      dateEvent: '08 Des 2023',
      imgOwner:
          'https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      posterTravel:
          'https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/revisi-2020/lombok1.jpg'),
];
