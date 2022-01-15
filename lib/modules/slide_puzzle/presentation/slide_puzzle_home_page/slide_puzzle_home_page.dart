import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzles/commons/render_widget.dart';
import 'package:puzzles/modules/slide_puzzle/presentation/slide_puzzle_home_page/controllers/slide_puzzle_home_controller.dart';

class SlidePuzzleHomePage extends StatefulWidget {
  const SlidePuzzleHomePage({Key? key}) : super(key: key);

  @override
  State<SlidePuzzleHomePage> createState() => _SlidePuzzleHomePageState();
}

class _SlidePuzzleHomePageState
    extends ModularState<SlidePuzzleHomePage, SlidePuzzleHomeController> {
  @override
  void initState() {
    controller.getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Modular.to.pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFF0B000),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF8338EC),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 65,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pick your image',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Select a image for your puzzle.',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Observer(builder: (context) {
                  return RenderWidget(
                    render: controller.store.loading,
                    child: const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(),
                    ),
                    replacement: Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsetsDirectional.only(bottom: 64),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: controller.store.imagesPaths.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => Modular.to.pushNamed(
                              "/slide-puzzle/game",
                              arguments: controller.store.imagesPaths[index]),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                width: 2,
                                color: const Color(0xFFFFBE0B),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    controller.store.imagesPaths[index]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
