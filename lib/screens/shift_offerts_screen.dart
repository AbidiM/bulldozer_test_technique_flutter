import 'package:bulldozer_test_technique_flutter/helpers/date_diff.dart';
import 'package:bulldozer_test_technique_flutter/models/offered_shifts_model.dart';
import 'package:bulldozer_test_technique_flutter/screens/shift_offer_details.dart';
import 'package:bulldozer_test_technique_flutter/viewmodels/shifts_view_model.dart';
import 'package:bulldozer_test_technique_flutter/widgets/post_price.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ShiftOffertsScreen extends StatefulWidget {
  const ShiftOffertsScreen({Key? key}) : super(key: key);

  @override
  State<ShiftOffertsScreen> createState() => _ShiftOffertsScreenState();
}

class _ShiftOffertsScreenState extends State<ShiftOffertsScreen> {
  List<OfferedShiftsModel> derniereMinute = <OfferedShiftsModel>[];
  List<OfferedShiftsModel> aVenir = <OfferedShiftsModel>[];

  @override
  void initState() {
    //get shift list
    ShiftsViewModel().fetchShifts().then(
      (value) {
        for (var element in value) {
            setState(() {
              dateDiff(DateTime.parse(element.startAt!))
                  ? derniereMinute.add(element)
                  : aVenir.add(element);
            });
          }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shifts offerts",
          style: GoogleFonts.ptSerif(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 42,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),

        //List Derniere Minute
        derniereMinute.isEmpty
            ? SizedBox()
            : Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Aujourd'hui",
                        style: GoogleFonts.ptSerif(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: derniereMinute.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ShiftOfferDetails(
                                  offeredShiftsModel: derniereMinute[index],
                                ),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 10.0),
                              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    derniereMinute[index].company!,
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Aujour'hui",
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  PostPrice(
                                    offeredShiftsModel: derniereMinute[index],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
        //List A Venir
        aVenir.isEmpty
            ? SizedBox()
            : Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Shift a venir",
                        style: GoogleFonts.ptSerif(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 10.0),
                        itemCount: aVenir.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ShiftOfferDetails(
                                  offeredShiftsModel: aVenir[index],
                                ),
                              ),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 10.0),
                              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0),
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    aVenir[index].company!,
                                    style: GoogleFonts.ptSerif(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    DateFormat('EEEE, d MMMM').format(
                                      DateTime.parse(aVenir[index].startAt!),
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
                                    offeredShiftsModel: aVenir[index],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
