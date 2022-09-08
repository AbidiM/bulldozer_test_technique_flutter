import 'package:bulldozer_test_technique_flutter/models/offered_shifts_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PostPrice extends StatelessWidget {
  const PostPrice({
    Key? key,
    required this.offeredShiftsModel,
  }) : super(key: key);
  final OfferedShiftsModel offeredShiftsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 70,
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0XFFEFEFEF),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              child: Text(
                offeredShiftsModel.postName!,
                style: GoogleFonts.ptSerif(
                  textStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            RichText(
                text: TextSpan(
              text: "${offeredShiftsModel.buyPrice!}\$/H",
              style: GoogleFonts.ptSerif(
                textStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              children: [
                TextSpan(
                  text:
                      offeredShiftsModel.bonus == 0 ? "" : " + ${offeredShiftsModel.bonus}\$/H",
                  style: GoogleFonts.ptSerif(
                    textStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
        Text(
          "${DateFormat.Hm().format(
            DateTime.parse(offeredShiftsModel.startAt!),
          )} - ${DateFormat.Hm().format(
            DateTime.parse(offeredShiftsModel.endAt!),
          )}",
          style: GoogleFonts.ptSerif(
            textStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
