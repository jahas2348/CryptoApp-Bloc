import 'package:cryptofy/presentation/blocs/home_bloc/crypto_event.dart';
import 'package:cryptofy/presentation/blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:cryptofy/presentation/blocs/watchlist_bloc/watchlist_event.dart';
import 'package:cryptofy/presentation/constants/color_styles/colors.dart';
import 'package:cryptofy/presentation/screens/home/sub_screen_coin/coins_screen.dart';
import 'package:cryptofy/presentation/screens/home/sub_screen_watchlist/watchlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_bloc/crypto_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<CryptoBloc>().add(InitialEvent());
    context.read<WatchlistBloc>().add(WatchListInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: CustomColors.appBarColor,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Cryptofy'),
          ),
          actions: [
            InkWell(
              onTap: () {
                context.read<CryptoBloc>().add(InitialEvent());
              },
              child: Icon(Icons.downloading_outlined, size: 30,)),
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 14),
              child: Image(image: AssetImage('assets/images/crptofy-logo.png',), width: 35,),
            ),
            SizedBox(
              width: 20,
            ),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              child: TabBar(
              dividerColor: Colors.white,
              // indicatorColor: Colors.amber,
            
                // indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(
                    child: Text(
                      'Coins',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Watchlist',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CoinScreen(),
                  WatchListPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
