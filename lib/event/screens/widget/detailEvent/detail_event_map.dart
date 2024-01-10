import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:payment_module/event/screens/widget/detailEvent/widgets/event_map_header.dart';
import 'package:payment_module/event/styles/style.dart';

class DetailEventMap extends StatefulWidget {
  const DetailEventMap(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.address});

  final double latitude;
  final double longitude;
  final String address;

  @override
  State<DetailEventMap> createState() => _DetailEventMapState();
}

class _DetailEventMapState extends State<DetailEventMap> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.85,
            color: Colors.white,
            child: Column(
              children: [
                const EventMapHeader(),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: GoogleMap(
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                          },
                          initialCameraPosition: CameraPosition(
                            target: LatLng(widget.latitude, widget.longitude),
                            zoom: 15.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Location Detail',
                                style: TextStyle(
                                    fontSize: subTitleFontSize,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 24,
                                child: IconButton(
                                  iconSize: 24,
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.map,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            alignment: WrapAlignment.start,
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: secondary, size: 24),
                              Text(
                                widget.address,
                                style: TextStyle(
                                    fontSize: subTitleFontSize,
                                    color: secondary),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
