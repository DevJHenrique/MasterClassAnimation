import 'package:flutter/material.dart';

import 'components/custom_expansion_tile.dart';

class AnimationTwoPage extends StatefulWidget {
  const AnimationTwoPage({super.key});

  @override
  State<AnimationTwoPage> createState() => _AnimationTwoPageState();
}

class _AnimationTwoPageState extends State<AnimationTwoPage> {
  int? selectedIndex;
  Duration duration = const Duration(milliseconds: 100);
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyScrollView'),
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: 50,
        itemBuilder: (context, index) {
          return CustomExpansionTile(
            onTap: () {
              setState(() {
                controller.animateTo(48 * index + 1,
                    duration: duration, curve: Curves.linear);
                if (selectedIndex == index) {
                  selectedIndex = null;
                } else {
                  selectedIndex = index;
                }
              });
            },
            title: 'My expansion tile $index',
            isExpanded: selectedIndex == index,
            child: Column(
              children: [
                Image.network('https://picsum.photos/100?image=$index'),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quo studio Aristophanem putamus aetatem in litteris duxisse? Si enim ita est, vide ne facinus facias, cum mori suadeas. Quodcumque in mentem incideret, et quodcumque tamquam occurreret. Qui potest igitur habitare in beata vita summi mali metus? Duo Reges: constructio interrete. Ostendit pedes et pectus',
                ),
                Divider()
              ],
            ),
          );
        },
      ),
    );
  }
}
