import 'package:flutter/material.dart';
import '../../api/constants.dart';
import '../../api/service.dart';
import '../../constants/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool searchChange = false;
  final FocusNode _focusNode = FocusNode();

  // @override
  // void initState() {
  //   _focusNode.addListener(changeView);
  //   super.initState();
  // }

  // void changeView() {
  //   setState(() {});
  // }

  // @override
  // void dispose() {
  //   _focusNode.removeListener(changeView);
  //   _focusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: constBlackColor,
        appBar: AppBar(
          backgroundColor: constBlackColor,
          title: searchChange == false
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      searchChange = true;
                    });
                  },
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.search,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        customText(
                            text: 'Search', size: 18, color: Colors.grey),
                      ],
                    ),
                  ),
                )
              : Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Icon(
                              Icons.search,
                              size: 18,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 15,
                            child: TextField(
                              autofocus: true,
                              focusNode: _focusNode,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 9),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      width: 320,
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          searchChange = false;
                        });
                      },
                      child: customText(
                          text: 'Cancel', color: Colors.grey, size: 18),
                    )
                  ],
                ),
        ),
        body: FutureBuilder(
          future: HttpServices().getUpcoming(Constants.upComing),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              List<dynamic> list = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: customText(
                      text: 'Top Searches',
                      weight: FontWeight.bold,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: !_focusNode.hasFocus
                        ? ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 14, top: 10, bottom: 5),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: SizedBox(
                                        height: 80,
                                        width: 150,
                                        child: Image.network(
                                          '${Constants.imageId}${list[index].image}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      child: customText(
                                        size: 16,
                                        text: list[index].title,
                                        weight: FontWeight.bold,
                                      ),
                                      width: 150,
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: constWhiteColor,
                                        ),
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(.5),
                                      ),
                                      child: const Icon(
                                        Icons.play_arrow,
                                        size: 35,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 9 / 16),
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 14, top: 10, bottom: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: SizedBox(
                                    child: Image.network(
                                      '${Constants.imageId}${list[index].image}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  )
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget customText(
      {required String text,
      Color? color,
      double? size,
      FontWeight? weight,
      TextAlign? align}) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
