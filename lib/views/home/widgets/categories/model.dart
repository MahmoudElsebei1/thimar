part of 'cubit.dart';

class CategoryModel {
  late final String text, image,description;
  late final int id ;
  late final Color color;

  final _colors=[
    0xFFCB3534,
    0xFF3A6EA5,
    0xFFADC178,
    0xFFE49B0F
  ];

  CategoryModel(Map<String, dynamic> map){
    text=map['name']??'';
    image=map['media']??'';
    description=map['description']??'';
    id=map['id']??0;
    color=Color(_colors[Random().nextInt(_colors.length-1)]);

  }
}

class CategoriesData {
  late final List<CategoryModel> list;
  late final Meta meta;
  // Link not list<Link>
  late final Link links;
  late final String status, message;

  CategoriesData(Map<String, dynamic> map) {
    list=List.from(map['data'].map((e) => CategoryModel(e)));
    links = Link(map['links']);
    meta=Meta(map['meta']);
    message=map['message'];
    status=map['status'];
  }
}

class Link {
  late final String first, last, prev, next;

  Link(Map<String, dynamic> map) {
    first = map['first'] ?? "";
    last = map['last'] ?? "";
    prev = map['prev'] ?? "";
    next = map['next'] ?? "";
  }
}

class Meta {
  late final int currentPage, from, lastPage, perPage, to, total;
  late final String path;
  late final List<LinkPage> links;

  Meta(Map<String, dynamic> map) {
    currentPage = map['current_page'] ?? 0;
    from = map['from'] ?? 0;
    lastPage = map['last_page'] ?? 0;
    perPage = map['per_page'] ?? 0;
    to = map['to'] ?? 0;
    total = map['total'] ?? 0;
    path = map['path'] ?? "";

    // 3
    links = List.from(map['links'].map((e) => LinkPage(e)));

    // 2
    /*
    List<Map<String,dynamic>> linksMap=map['links'];
    links=List.generate(linksMap.length, (index) => Link(linksMap[index]),);
    */

    // 1
    /*
    links=[];
    linksMap.forEach(
        (element){
          final model=Link(element);
          links.add(model);
        }
    );
    */
  }
}

class LinkPage {
  late final String url, label;
  late final bool isActive;

  LinkPage(Map<String, dynamic> map) {
    url = map['url'] ?? "";
    label = map['label'] ?? "";
    isActive = map['active'] ?? false;
  }
}
