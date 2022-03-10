class TravelPlace {
  final String? id;
  final String? name;
  final TravelUser? user;
  final StatusTag? statusTag;
  final int? shared;
  final int? likes;
  final String? locationDesk;
  final String? description;
  final List<String>? imagesUrl;

  static final places = [
    TravelPlace(
        id: "3",
        name: "Luanda, Angola",
        likes: 500,
        shared: 200,
        description: 'Lorem Ipsum is simply dummy text of the printing and '
            'typesetting industry. Lorem Ipsum has been the industry\'s'
            ' standard dummy text ever since the 1500s, when an unknown print',
        imagesUrl: [
          "https://cdn.pixabay.com/photo/2021/02/11/12/27/instagood-6005121_960_720.jpg",
          "https://cdn.pixabay.com/photo/2020/05/06/23/07/angola-5139571_960_720.jpg",
          "https://cdn.pixabay.com/photo/2017/03/14/01/38/angola-2141667_960_720.jpg",
        ],
        statusTag: StatusTag.popular,
        user: TravelUser.alex,
        locationDesk: 'ANGOLA, ILHA DE LUANDA'),
    TravelPlace(
        id: "3",
        name: "Benguela",
        likes: 500,
        shared: 200,
        description: 'Lorem Ipsum is simply dummy text of the printing and '
            'typesetting industry. Lorem Ipsum has been the industry\'s'
            ' standard dummy text ever since the 1500s, when an unknown print',
        imagesUrl: [
          "https://cdn.pixabay.com/photo/2013/02/20/19/27/angola-83975_960_720.jpg",
          "https://cdn.pixabay.com/photo/2017/06/07/22/10/eventide-2381823_960_720.jpg",
          "https://cdn.pixabay.com/photo/2020/02/12/19/22/helmet-perl-chicken-4843636_960_720.jpg"
        ],
        statusTag: StatusTag.event,
        user: TravelUser.sara,
        locationDesk: 'BENGUELA, PRAI MORENA'),
    TravelPlace(
        id: "3",
        name: "Cabinda",
        likes: 500,
        shared: 200,
        description: 'Lorem Ipsum is simply dummy text of the printing and '
            'typesetting industry. Lorem Ipsum has been the industry\'s'
            ' standard dummy text ever since the 1500s, when an unknown print',
        imagesUrl: [
          "https://cdn.pixabay.com/photo/2014/10/30/19/21/angola-509598_960_720.jpg",
          "https://cdn.pixabay.com/photo/2018/10/12/09/32/sunset-3741772_960_720.jpg",
          "https://cdn.pixabay.com/photo/2013/02/06/00/29/angola-78211_960_720.jpg"
        ],
        statusTag: StatusTag.popular,
        user: TravelUser.mario,
        locationDesk: 'LUANDA, PRIMEIRO DE MAIO')
  ];

  TravelPlace(
      {this.id,
      this.name,
      this.user,
      this.statusTag,
      this.shared,
      this.likes,
      this.locationDesk,
      this.description,
      this.imagesUrl});
}

class TravelUser {
  TravelUser(this.name, this.urlPhoto);
  final String? name;
  final String? urlPhoto;

  static TravelUser alex = TravelUser("Alexandre Lopes",
      "https://images.unsplash.com/profile-1574623311321-015452cd1304image?dpr=1&auto=format&fit=crop&w=64&h=64&q=60&crop=faces&bg=fff");
  static TravelUser lili = TravelUser("Débora Sambo",
      "https://images.unsplash.com/profile-1580458510759-ae24e9eaa594image?dpr=1&auto=format&fit=crop&w=64&h=64&q=60&crop=faces&bg=fff");
  static TravelUser mario = TravelUser("Mário Francisco",
      "https://images.unsplash.com/profile-1598440130065-5bc72dd5f4f5image?dpr=1&auto=format&fit=crop&w=64&h=64&q=60&crop=faces&bg=fff");
  static TravelUser celestino = TravelUser("Celestino Lopes",
      "https://images.unsplash.com/profile-1642786497589-75d329ebf319?dpr=1&auto=format&fit=crop&w=64&h=64&q=60&crop=faces&bg=fff");
  static TravelUser sara = TravelUser("Sara Lopes",
      "https://images.unsplash.com/profile-1644415772148-03a326feb935image?dpr=1&auto=format&fit=crop&w=64&h=64&q=60&crop=faces&bg=fff");

  static List<TravelUser> users = [alex, lili, mario, celestino, sara];
}

enum StatusTag { popular, event }
