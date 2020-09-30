/*import 'package:nodemappweb/Models/Parts/battery.dart';
import 'package:nodemappweb/Models/Parts/fork.dart';
import 'package:nodemappweb/Models/Parts/frame.dart';
import 'package:nodemappweb/Models/Parts/fwheel.dart';
import 'package:nodemappweb/Models/Parts/motor.dart';
import 'package:nodemappweb/Models/Parts/rwheel.dart';
import 'package:nodemappweb/Models/bikes.dart';
import 'package:nodemappweb/Models/parts.dart';
import 'package:nodemappweb/Models/states.dart';
import 'package:nodemappweb/Models/user.dart';
import 'package:nodemappweb/Models/vendors/brand.dart';
import 'package:nodemappweb/Models/vendors/models.dart';
import 'package:mock_data/mock_data.dart';
import 'package:nodemappweb/Models/vendors/provider.dart';
import 'package:nodemappweb/Models/vendors/warranty.dart';

Brand mockUpBrand() => new Brand(mockUUID(), mockName());
Warranty mockUpWarranty() => new Warranty(mockUUID(), mockName(), mockString());
Provider mockUpProvider() => new Provider(mockUUID(), mockName());
Models mockUpModel() => new Models(
      mockUUID(),
      mockName(),
      mockUpBrand(),
    );
Frame mockUpFrame() => new Frame(mockName(), mockInteger(), mockDate(),
    mockUrl(), mockUUID(), mockString(), mockUpProvider());
Fork mockUpFork() => new Fork(mockName(), mockInteger(), mockDate(), mockUrl(),
    mockUUID(), mockString(), mockUpProvider());
Battery mockUpBattery() => new Battery(mockName(), mockInteger(), mockDate(),
    mockUrl(), mockUUID(), mockString(), mockUpProvider());
Fwheel mockUpFwheel() => new Fwheel(mockName(), mockInteger(), mockDate(),
    mockUrl(), mockUUID(), mockString(), mockUpProvider());
Rwheel mockUpRwheel() => new Rwheel(mockName(), mockInteger(), mockDate(),
    mockUrl(), mockUUID(), mockString(), mockUpProvider());
Motor mockUpMotor() => new Motor(mockName(), mockInteger(), mockDate(),
    mockUrl(), mockUUID(), mockString(), mockUpProvider());

Parts mockUpPart() => new Parts(mockUUID(), mockUpFrame(), mockUpFork(),
    mockUpBattery(), mockUpFwheel(), mockUpMotor(), mockUpRwheel());

Bikes mockUpBike() => new Bikes(mockUUID(), mockName(), mockUpModel(),
    mockInteger(), mockUpPart(), mockUrl(), States.New, mockUpWarranty());

List<Bikes> mockupListBikes(int nbikes) {
  List<Bikes> mockUpListBike = [];
  for (var i = 0; i < nbikes; i++) {
    mockUpListBike.add(mockUpBike());
    print(mockUpListBike[i].warranty.uuid);
  }

  return mockUpListBike;
}

User mockUpUser() =>
    new User(mockUUID(),"Edgar", "123456","Gago Carrillo","edgargc", "edgarg.upc@gmail.com", "123456","693430654",false,mockDate().toString(),mockDate().toString(),mockDate().toString());

User mockUpCreateUser(String uuid, String name, String password, String lastname, String username, String email, String iddoc, String phone, bool isVerfied, String createdAt, String updatedAt, String deletedAt) =>
    new User( uuid,  name,  password,  lastname,  username,  email,  iddoc,  phone,  isVerfied,  createdAt,  updatedAt,  deletedAt);
*/