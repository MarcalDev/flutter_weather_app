import 'package:flutter/material.dart';

class CitySelectorPage extends StatefulWidget {
  const CitySelectorPage({Key? key}) : super(key: key);

  @override
  State<CitySelectorPage> createState() => _CitySelectorPageState();
}

class _CitySelectorPageState extends State<CitySelectorPage> {
  Color _primaryColor = const Color(0xff3330f2);
  @override
  Widget build(BuildContext context) {
    Widget headerSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Icon(Icons.arrow_back_ios_new_rounded, color: _primaryColor),
          onTap: (){
            Navigator.of(context).pop();
          },
        ),
        const Expanded(
            child: Center(
          child:
          Text(
              "SEARCH CITY",
              style: TextStyle(
                  fontFamily: 'ProximaNovaSemiBold',
                  fontWeight: FontWeight.w500,
                  fontSize: 18
              ),
          ),
        ),
        )
      ],
    );
    Widget searchBarSection = Card(
      shadowColor: Colors.transparent,
      elevation: 0,
      color: const Color(0xffededed),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Icon(Icons.search, color: _primaryColor),
          ),
          const Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  obscureText: false,
                  style: TextStyle(
                    fontFamily: 'ProximaNovaSemiBold',
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    labelText: '',
                    hintText: 'City name',
                    hintStyle: TextStyle(
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black26,
                    ),

                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ) ,
              ),
          )
        ],
      )


    );
    Widget cityListSection = Column(
      children: [
        _cityListItemSelectedCard('Bauru, SP','Brasil'),
        _cityListItemUnselectedCard('Paraty, RJ', 'Brasil'),
        _cityListItemUnselectedCard('Marília, SP', 'Brasil'),
      ],
    );
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(35,85,35,0),
        child: Column(
          children: [
            headerSection,
            Padding(
                padding: const EdgeInsets.only(top:20, bottom: 15),
                child: searchBarSection,
            ),
            cityListSection,
          ],
        ),
      )

    );
  }

  Card _cityListItemSelectedCard(String cityName, String countryName){
    return Card(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: _primaryColor)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.check_circle, color: _primaryColor),
            Expanded(
                child:Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          cityName,
                          style: const TextStyle(
                            fontFamily: 'ProximaNovaSemiBold',
                            fontWeight: FontWeight.w400,
                            fontSize: 18
                          ),
                      ),
                      Text(
                        countryName,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontFamily: 'ProximaNova',
                          color: Colors.black54,
                          fontSize: 16
                        ),
                      ),
                    ],
                  )
                )
            )
          ],
        ),
      )
    );
  }
  Card _cityListItemUnselectedCard(String cityName, String countryName){
    return Card(
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: Colors.transparent,)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.history, color: Colors.black54,),
              Expanded(
                  child:Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cityName,
                            style: const TextStyle(
                                fontFamily: 'ProximaNovaSemiBold',
                                fontWeight: FontWeight.w400,
                                fontSize: 18
                            ),
                          ),
                          Text(
                            countryName,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.black54,
                                fontSize: 16
                            ),
                          ),
                        ],
                      )
                  )
              )
            ],
          ),
        )
    );
  }
}
