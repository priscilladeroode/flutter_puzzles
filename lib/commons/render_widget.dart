import 'package:flutter/material.dart';

class RenderWidget extends StatelessWidget {
  final bool render;
  final Widget child;
  final Widget? replacement;
  const RenderWidget(
      {Key? key, required this.render, required this.child, this.replacement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render ? child : replacement ?? Container();
  }
}

// Stack(
//               children: [

//                 if (controller.store.slideObjects != null)
//                   ...controller.store.slideObjects!
//                       .where((slideObject) => slideObject.empty)
//                       .map(
//                     (slideObject) {
//                       return Positioned(
//                         left: slideObject.posCurrent.dx,
//                         top: slideObject.posCurrent.dy,
//                         child: SizedBox(
//                           width: slideObject.size.width,
//                           height: slideObject.size.height,
//                           child: Container(
//                             alignment: Alignment.center,
//                             margin: const EdgeInsets.all(2),
//                             color: Colors.white24,
//                             child: Stack(
//                               children: [
//                                 ...[
//                                   Observer(builder: (context) {
//                                     return Opacity(
//                                       opacity:
//                                           controller.store.success ? 1 : 0.3,
//                                       child: slideObject.image,
//                                     );
//                                   })
//                                 ]
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ).toList(),
//                 if (controller.store.slideObjects != null)
//                   ...controller.store.slideObjects!
//                       .where((slideObject) => !slideObject.empty)
//                       .map(
//                     (slideObject) {
//                       return AnimatedPositioned(
//                         duration: const Duration(milliseconds: 200),
//                         curve: Curves.ease,
//                         left: slideObject.posCurrent.dx,
//                         top: slideObject.posCurrent.dy,
//                         child: GestureDetector(
//                           onTap: () =>
//                               controller.changePos(slideObject.indexCurrent),
//                           child: SizedBox(
//                             width: slideObject.size.width,
//                             height: slideObject.size.height,
//                             child: Container(
//                               alignment: Alignment.center,
//                               margin: const EdgeInsets.all(2),
//                               color: Colors.blue,
//                               child: Stack(
//                                 children: [
//                                   ...[slideObject.image],
//                                   Center(
//                                     child: Text(
//                                       "${slideObject.indexDefault}",
//                                     ),
//                                   ),

//                                   // nice one.. lets make it random
//                                 ],
//                               ),
//                               // nice one
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ).toList()
//               ],
//             ),
