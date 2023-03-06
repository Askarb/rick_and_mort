import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/home_page/cubit/get_character_cubit.dart';

import '../widgets/user_container.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetCharacterCubit>(context).getCharecter('');
    String defaultImage =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvsR0DsIbpVZojO0oLDL0ULtzowuzr8FbHwQ&usqp=CAU';
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) {
                BlocProvider.of<GetCharacterCubit>(context).getCharecter(val);
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: BlocBuilder<GetCharacterCubit, GetCharacterState>(
                builder: (context, state) {
                  if (state is GetCharacterSuccess) {
                    final model = state.model.results;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.model.results?.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UserContainer(
                          id: '${model?[index].id}',
                          image: model?[index].image ?? defaultImage,
                          name: model?[index].name ?? '',
                          species: model?[index].species ?? '',
                          gender: model?[index].gender ?? '',
                          status: model?[index].status ?? '',
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
