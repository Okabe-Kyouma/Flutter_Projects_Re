import 'package:countries/widgets/filters.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({required this.filteredList,super.key});

  final void Function(List<bool> list) filteredList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                Icons.location_city,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 38,
              ),
              Text(
                'Where to?',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.location_on,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Continents',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                  ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => Filters(filteredList: filteredList,)),
            ).then(
              (value) => Navigator.pop(context),
            );
          },
        )
      ],
    );
  }
}
