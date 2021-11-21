class Recipe {
  const Recipe({
    required this.label,
    this.imageUrl,
  });

  final String label;
  final String? imageUrl;

  static final recipes = <Recipe>[
    const Recipe(
        label: 'Pizza',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Pizza_%281%29.jpg/1200px-Pizza_%281%29.jpg'),
    const Recipe(
      label: 'Spaghetti fruit de mer',
      imageUrl: 'https://img.lovepik.com/photo/50077/4812.jpg_wh860.jpg',
    ),
    const Recipe(
      label: 'Spaghetti fruit de mer',
      imageUrl:
          'https://supervalu.ie/thumbnail/720x400/var/files/real-food/recipes/Uploaded-2020/spaghetti-bolognese-recipe.jpg?fill=1',
    ),
    const Recipe(
      label: 'Spaghetti fruit de mer',
      imageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/06/ce/8f/a6/le-lido.jpg',
    ),
  ];
}
