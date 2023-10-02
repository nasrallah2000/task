import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/home_controller.dart';

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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(end: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "الأقسام /",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
                ),
                Text(
                  " الرئيسية",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 30, vertical: 20),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 5,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                mainAxisExtent: 150,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(color: Colors.black),
                );
              },
              shrinkWrap: true,
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
