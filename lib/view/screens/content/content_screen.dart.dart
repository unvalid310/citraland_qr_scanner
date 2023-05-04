import 'package:citraland/data/model/content_model.dart';
import 'package:citraland/utill/images.dart';
import 'package:citraland/utill/styles.dart';
import 'package:citraland/view/base/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentScreen extends StatefulWidget {
  final ContentModel content;
  const ContentScreen({Key key, @required this.content}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                fadeInDuration: Duration(milliseconds: 200),
                placeholder: Images.image_placeholder,
                image: widget.content.image,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.content.judul,
                      style: poppinsBold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 20),
                    // Overview
                    Text(
                      'Overview',
                      style: poppinsBold.copyWith(
                        fontSize: 14.sp,
                        color: Color(0xFFbda588),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      widget.content.description,
                      textAlign: TextAlign.justify,
                      style: poppinsRegular.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      widget.content.subdescription,
                      textAlign: TextAlign.justify,
                      style: poppinsRegular.copyWith(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20),
                    // detail
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.ic_kawasan, height: 23),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Overview',
                            style: poppinsMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Denveer',
                          style: poppinsRegular.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.ic_luas_tanah, height: 23),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Luas Tanah',
                            style: poppinsMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '136',
                          style: poppinsRegular.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.ic_luas_bangunan, height: 23),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Luas Bangunan',
                            style: poppinsMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '146',
                          style: poppinsRegular.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.ic_kamar_tidur, height: 23),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Kamar Tidur',
                            style: poppinsMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '3 + 1',
                          style: poppinsRegular.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.ic_kamar_mandi, height: 23),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Kamar Mandi',
                            style: poppinsMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '4 + 1',
                          style: poppinsRegular.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.ic_ruang_makan, height: 23),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Ruang Makan',
                            style: poppinsMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '1',
                          style: poppinsRegular.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.ic_ruang_keluarga, height: 23),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Ruang Keluarga',
                            style: poppinsMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '1',
                          style: poppinsRegular.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.ic_car_pot, height: 23),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Car Pot',
                            style: poppinsMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '1',
                          style: poppinsRegular.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Images.ic_garasi, height: 23),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Garasi',
                            style: poppinsMedium.copyWith(fontSize: 12.sp),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '-',
                          style: poppinsRegular.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Fasilitas
                    Text(
                      'Fasilitas',
                      style: poppinsBold.copyWith(
                        fontSize: 14.sp,
                        color: Color(0xFFbda588),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      widget.content.fasilitasText,
                      textAlign: TextAlign.center,
                      style: poppinsRegular.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.ic_cctv,
                              height: 60,
                            ),
                            Text(
                              'Surveillance System',
                              style: poppinsBold.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.ic_security,
                              height: 60,
                            ),
                            Text(
                              '24 x 7 Security',
                              style: poppinsBold.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.ic_firefighting,
                              height: 60,
                            ),
                            Text(
                              'Firefighting System',
                              style: poppinsBold.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.ic_swiming_pool,
                              height: 60,
                            ),
                            Text(
                              'Swimming Pool',
                              style: poppinsBold.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.ic_childern_play_area,
                              height: 60,
                            ),
                            Text(
                              "Children's play area",
                              style: poppinsBold.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.ic_landscape,
                              height: 60,
                            ),
                            Text(
                              'Landscape Garden',
                              style: poppinsBold.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.ic_meetingroom,
                              height: 60,
                            ),
                            Text(
                              'AC Community Hall',
                              style: poppinsBold.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              Images.ic_fitnes,
                              height: 60,
                            ),
                            Text(
                              'Fitness Center',
                              style: poppinsBold.copyWith(fontSize: 9.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    PrimaryButton(
                      label: 'Show location',
                      onTap: () async {
                        final _mapsLinks = widget.content.mapsLink;

                        if (!await launchUrl(Uri.parse(_mapsLinks))) {
                          throw Exception('Could not launch $_mapsLinks');
                        } else {
                          launchUrl(Uri.parse(_mapsLinks));
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
