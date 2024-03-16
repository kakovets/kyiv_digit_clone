import 'package:flutter/material.dart';

class AirRaidWidget extends StatelessWidget {
  const AirRaidWidget({super.key, required this.canceled, required this.time});

  final bool canceled;
  final TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.orange.shade100,
                ),
              ),
              const Icon(
                Icons.warning_amber,
                color: Colors.deepOrange,
                size: 24,
              ),
            ],
          ),
          const SizedBox(width: 12,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: canceled ? Colors.lightGreenAccent.shade700 : Colors.red,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Flexible(
                      child: Text(
                        '${time.hour.toString().padLeft(2, '0')}:'
                            '${time.minute.toString().padLeft(2, '0')} '
                            '${canceled ? 'відбій тривоги' : 'повітряна тривога!'}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  canceled
                      ?
                  'Небезпека тривала 34 хвилини.'
                      :
                  'Прямуйте до укриття та чекайте на відбій.',
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}