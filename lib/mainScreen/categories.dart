import 'package:flutter/material.dart';
import 'components/searchBar.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: 680),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            SearchBar(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Color.fromARGB(233, 233, 233, 233)),
              elevation: MaterialStateProperty.all(0),
              hintText: "Search...",
              leading: const Icon(Icons.search),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20)),
              hintStyle:
                  MaterialStateProperty.all(TextStyle(color: Colors.grey)),
            ),
            Flexible(
                child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.fiber_new,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "New Arrivals",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )
                                ],
    return ListView(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SearchBar(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => Color.fromARGB(233, 233, 233, 233)),
                elevation: MaterialStateProperty.all(0),
                hintText: "Search...",
                leading: const Icon(Icons.search),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20)),
                hintStyle:
                    MaterialStateProperty.all(TextStyle(color: Colors.grey)),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.fiber_new,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '208 Products',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
<<<<<<< HEAD
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.fiber_new,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Clothes",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )
                                ],
=======
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.person_rounded,
                                  color: Colors.white,
                                ),
>>>>>>> 77d94fcbd3ea9e8398d33aa3fe2fac8eff554853
                              ),
                            ),
                            Text(
                              '358 Products',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
<<<<<<< HEAD
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.shopping_bag,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Bags",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )
                                ],
=======
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
>>>>>>> 77d94fcbd3ea9e8398d33aa3fe2fac8eff554853
                              ),
                            ),
                            Text(
                              '150 Products',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
<<<<<<< HEAD
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 130,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: const Icon(
                                      Icons.electric_bolt_sharp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    "Electronics",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  )
                                ],
=======
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: const Icon(
                                  Icons.electric_bolt_sharp,
                                  color: Colors.white,
                                ),
>>>>>>> 77d94fcbd3ea9e8398d33aa3fe2fac8eff554853
                              ),
                            ),
                            const Text(
                              '133 Products',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
