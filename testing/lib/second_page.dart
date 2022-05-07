import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/bloc/AyaModel.dart';
import 'package:testing/bloc/aya_cubit.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AyaCubit(),
        child: Center(
            child: BlocBuilder<AyaCubit, AyaState>(
              builder: (context, state) {
                switch (state.status){
                  case DataStatus.initial:
                    return const SizedBox();
                  case DataStatus.loading:
                    return const CircularProgressIndicator();
                  case DataStatus.success:
                    return Text(state.ayaModel?.data?.text ?? "");
                  case DataStatus.failure:
                    return const Icon(Icons.error);
                }
              },
            )
        ),
      ),
    );
  }
}
