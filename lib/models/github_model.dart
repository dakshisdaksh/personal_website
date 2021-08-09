class Repo{
  late String name;
  late String htmlUrl;
  late String description;


  //constructor
  Repo({required this.name, required this.htmlUrl, required this.description });
  factory Repo.fromJson(Map<String, dynamic> json){
    print(json["html_url"]);
    return Repo(name: json["name"], htmlUrl: json["html_url"], description: json["description"]);
  }



}
class All {
  late List<Repo> repos;
  All({required this.repos});
  factory All.fromJson(List<dynamic> json) {
    List<Repo> repos;
    print(json);
    repos = json.map((r) => Repo.fromJson(r)).toList();
    print(repos);
    print(All (repos: repos));
    return All(repos: repos);
  }
}