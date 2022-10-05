class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> onboard_data = [
  OnBoard(
    image: 'lib/assets/images/neon_crown.png',
    title: 'Create a LED banner',
    description:
        'Choose a color, dynamic background, font, size and make your own banner',
  ),
  OnBoard(
    image: 'lib/assets/images/comment.png',
    title: 'Help up to improve the app',
    description: 'We are constantly improving and need your opinion',
  ),
  OnBoard(
    image: 'lib/assets/images/features.png',
    title: 'Additional features',
    description:
        'Change the speed of direction of movement, add a flashing effect',
  ),
  OnBoard(
    image: 'lib/assets/images/wow.webp',
    title: 'Your best creative banner!',
    description: 'Subscribe to unlock all the features, just \$3.99/week',
  ),
];
