import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/home_controller.dart';
import 'package:task/widgets/grid_item.dart';
import 'package:task/widgets/home_title.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController _scrollController = ScrollController();
  bool _isTitleVisible = false;
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= 43) {
        if (!_isTitleVisible) {
          setState(() {
            _isTitleVisible = true;
          });
        }
      } else {
        if (_isTitleVisible) {
          setState(() {
            _isTitleVisible = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 115,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: _isTitleVisible ? 70 : 50,
            centerTitle: true,
            leading: SizedBox(),
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.card_travel,
                          size: 28,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          size: 28,
                        ),
                      ),
                      _isTitleVisible
                          ? const SizedBox()
                          : IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                size: 28,
                              ),
                            ),
                      _isTitleVisible
                          ? Hero(
                              tag: 'form1',
                              child: SizedBox(
                                height: 45,
                                width: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                        hintText: 'Search for products'),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      _isTitleVisible ? const SizedBox() : const Spacer(),
                      IconButton(
                        onPressed: () {
                          controller.scaffoldKey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                        ),
                      ),
                    ],
                  ),
                  !_isTitleVisible
                      ? Hero(
                          tag: 'form1',
                          child: SizedBox(
                            height: 45,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: 'Search for products',
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ];
      },
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const HomeTitle(),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 150,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return const GridItem();
                },
                shrinkWrap: true,
                itemCount: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
