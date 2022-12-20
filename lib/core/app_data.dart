import 'package:gotrip/models/trip_model.dart';
import 'package:gotrip/models/user_model.dart';

List<String> carTypes = ["Bus", "Taxi"];

//sample data
TripModel tripData = TripModel(
    driver: UserModel(
      id: 1,
      firstName: "John",
      lastName: "Doe",
      email: "jd@gmail.com",
      phone: "0241234567",
      credits: 0,
      isVerified: true,
    ),
    id: 1,
    from: "Accra",
    to: "Kumasi",
    fare: 25.00,
    carNumber: "GR-1234-14",
    carType: "Bus",
    departure: DateTime(2022, 12, 30, 12, 30, 0),
    seatAvailable: 4);
