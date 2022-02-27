class UnbordingContent {
  String image;
  String title;

  UnbordingContent({
    required this.image,
    required this.title,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Find Jobs from all over the internet at one platform',
    image: 'assets/images/first.svg',
  ),
  UnbordingContent(
    title: 'Easy UI that lets you find your dream job in just 3 steps',
    image: 'assets/images/second.svg',
  ),
  UnbordingContent(
    title: 'Search For Job, Select Job & Apply',
    image: 'assets/images/third.svg',
  ),
];
