import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradix/business_logic/blocs/coins/coins_bloc.dart';

class HomeViewMobile extends StatelessWidget {
  const HomeViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CoinsBloc, CoinsState>(
          builder: (context, state) {
            return Text(state.coins.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Text("Click"),
          onPressed: () {
            context.read<CoinsBloc>().add(CoinsFetchEvent());
          }),
    );
  }
}
