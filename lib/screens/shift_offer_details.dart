import 'package:bulldozer_test_technique_flutter/helpers/constants.dart';
import 'package:bulldozer_test_technique_flutter/helpers/date_diff.dart';
import 'package:bulldozer_test_technique_flutter/models/offered_shifts_model.dart';
import 'package:bulldozer_test_technique_flutter/widgets/details_shift_data.dart';
import 'package:bulldozer_test_technique_flutter/widgets/post_price.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class ShiftOfferDetails extends StatelessWidget {
  const ShiftOfferDetails({Key? key, required this.offeredShiftsModel})
      : super(key: key);
  final OfferedShiftsModel offeredShiftsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100.0),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://www.ikea.com/us/en/images/products/lerhamn-chair-black-brown-vittaryd-beige__0728160_pe736117_s5.jpg?f=s",
                          scale: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      offeredShiftsModel.company!,
                      style: GoogleFonts.ptSerif(
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  dateDiff(DateTime.parse(offeredShiftsModel.startAt!))
                      ? Text(
                          "Aujourd'hui",
                          style: GoogleFonts.ptSerif(
                            textStyle: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 18,
                            ),
                          ),
                        )
                      : Text(
                          DateFormat.yMMMd().format(
                            DateTime.parse(offeredShiftsModel.startAt!),
                          ),
                          style: GoogleFonts.ptSerif(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  PostPrice(
                    offeredShiftsModel: offeredShiftsModel,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DetailsShiftData(
                    icon: LineIcons.mapMarker,
                    text: offeredShiftsModel.latitude.toString(),
                  ),
                  //only show when bonus greater than 0
                  offeredShiftsModel.bonus == 0
                      ? SizedBox()
                      : DetailsShiftData(
                          icon: LineIcons.dollarSign,
                          text: "+${offeredShiftsModel.bonus}\$/H",
                        ),
                  
                  DetailsShiftData(
                    icon: LineIcons.pause,
                    text: "Pause de 30 minutes",
                  ),
                  DetailsShiftData(
                    icon: LineIcons.parking,
                    text: "Stationnement gratuit",
                  ),
                  DetailsShiftData(
                    icon: LineIcons.tShirt,
                    text: "Pantalon noir, chemise",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Responsable",
                    style: GoogleFonts.ptSerif(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    offeredShiftsModel.postName!,
                    style: GoogleFonts.ptSerif(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: seaSerpent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                ),
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Postuler",
                    style: GoogleFonts.ptSerif(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

