class DappMetaData {
  String topic;
  String name;
  String icon;
  String url;
  
  DappMetaData(this.name, this.icon, this.url, this.topic);

  DappMetaData.fromJson(Map<String, dynamic> json)
      : topic = json['topic'],
        name = json['name'],
        icon = json['icon'],
        url = json['url'];

  static Map<String, dynamic> toJson(DappMetaData value) => {
        'topic': value.topic,
        'name': value.name,
        'icon': value.icon,
        'url': value.url
      };
}
