import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
import 'package:latihan_dua/screens/categories.dart';
import 'package:latihan_dua/screens/cart.dart';
import 'package:latihan_dua/screens/profile.dart';
import '../components/salesBanner.dart';
import '../components/searchBar.dart';
import '../components/header.dart';
import '../components/firstDispay.dart';
import 'package:latihan_dua/routes/routes.dart';
import 'detail_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //init
  int selectedIndex = 0;

  //function
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> display = [
      HomeBody(
        setSelectedIndex: onItemTapped,
      ),
      const CategoriesScreen(),
      const CartScreen(),
    ];
    //variable
    print("im here");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce",
      theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.white)),
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          flexibleSpace: Container(
            // color: Colors.amber,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.black,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.menu_open),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
                Center(
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Color.fromARGB(221, 221, 221, 221),
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.person_3),
                      color: Colors.black54,
                      onPressed: () {
                        Navigator.of(context)
                            .push(AnimationRoute(const ScrProfile()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: display.elementAt(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onItemTapped,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          // selectedIconTheme: IconThemeData(size: 10),
          currentIndex: selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tag),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key, required this.setSelectedIndex});

  @override
  State<HomeBody> createState() => _HomeBodyState();

  final Function setSelectedIndex;
}

class _HomeBodyState extends State<HomeBody> {
  List? products;

  late ScrollController _controller;

  FocusNode _searchBarFocusNode = FocusNode();
  bool _isContainerVisible = false;

  void setContainerVisibility(bool value) {
    setState(() {
      _isContainerVisible = value;
    });
    print(_isContainerVisible);
  }

  void setProducts(List value) {
    setState(() {
      products = value;
    });
    print(products);
  }

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 680),
        child: StickyContainer(
          displayOverFlowContent: true,
          stickyChildren: [
            StickyWidget(
              initialPosition: StickyPosition(top: 112, right: 0),
              finalPosition: StickyPosition(top: 0, right: 0),
              controller: _controller,
              child: Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(maxWidth: 680),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SearchingBar(
                        setSelectedIndex: widget.setSelectedIndex,
                        focusNode: _searchBarFocusNode,
                        setVisibleContainer: setContainerVisibility,
                        setProducts: setProducts),
                    Visibility(
                      visible: _isContainerVisible,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height / 3),
                        width: MediaQuery.of(context).size.width,
                        child: products == null
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : ListView.builder(
                                itemCount: products!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 1),
                                    child: InkWell(
                                      onTap: () {
                                        print(products![index].id);
                                        Navigator.of(context).push(
                                            AnimationRoute(ScrDetailItem(
                                                id: products![index].id)));
                                        // Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        // color: Colors.blue,
                                        height: 60,
                                        child: Card(
                                          child: Container(
                                            padding: const EdgeInsets.all(4),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 40,
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(5)),
                                                    child: Flexible(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  products![
                                                                          index]
                                                                      .thumbnail),
                                                              fit: BoxFit.fill),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4),
                                                  margin: const EdgeInsets.only(
                                                      left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        products![index].title,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                      ),
                                                      Text(
                                                        products![index]
                                                            .category,
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          child: ListView(
            controller: _controller,
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: 100,
                child: const HeaderScreenOne(),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 30),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(5, (index) {
                    return const SalesBanner();
                  }),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: const FirstDisplay(
                  category: "womens-dresses",
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: const FirstDisplay(
                  category: "mens-shirts",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
