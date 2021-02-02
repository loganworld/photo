// ignore: camel_case_types
class userinfotype {
  String firstname = "Andrew";
  String lastname = "Smith";
  String name = "Andrew Mehrtens";
  int booking = 2;
  int panding = 0;
  int sold = 3;
  String email = "mechrtens@phothpraph.my"; //@ do validatio
  String starttime = "November 4,2020";
  String endtime = "February 4,2022";
  String password = "";
  String phonenumber = "47638279422";
  String website = "";
  DateTime birthday = new DateTime(1990, 3, 4);
  String gender = "";
}

class userdatatype {
  String date = "JAN 25";
  String header = "Yuri Serovic, ir-store purchase";
  String body = "at 09.00, Room 203c, \$200";
  userdatatype({date, header, body});
}

class bookingdatatype {
  String date = "JAN 25";
  String firstname = "Andre";
  String lastname = "smith";
  String detail = "Time 09.00, Room 2000";
  String state = "Done";
  String room = "";
  String email = "";
  String country_code = "";
  String phonenumber = "";
  DateTime checkout_date;
  DateTime photoshoot_date;
  String photographer = "Optional";
  String notices = "Optional";
  bookingdatatype(
      {date,
      firstname,
      lastname,
      detail,
      state,
      room,
      email,
      country_code,
      phonenumber,
      checkout_date,
      photoshoot_date,
      photographer,
      notices});
}
