import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<String> itemNames;
  final List<String?> iconPaths;
  final List<Color>? itemColors;
  final List<Widget> targetScreens;
  final double crossAxisCount;

  const CustomGridView({
    Key? key,
    required this.itemNames,
    this.itemColors,
    required this.targetScreens,
    this.crossAxisCount = 2.0, required this.iconPaths,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(itemNames.length == iconPaths.length &&
        itemNames.length == targetScreens.length &&
        (itemColors == null || itemNames.length == itemColors!.length),
        'Lists (itemNames, iconPaths, itemColors, targetScreens) must have the same length');

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: crossAxisCount.toInt(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        children: List.generate(itemNames.length, (index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => targetScreens[index])),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: itemColors?[index] ?? Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPaths[index]!,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    itemNames[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
