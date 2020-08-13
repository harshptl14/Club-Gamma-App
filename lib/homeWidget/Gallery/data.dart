import 'package:flutter/material.dart';
import 'package:flutter_devfest/utils/devfest.dart';

class EventGallery {
  final String name;
  final String time;
  final String content;
  final List<dynamic> doodle;
  final Color iconBackground;
  final Icon icon;
  const EventGallery(
      {this.name,
      this.time,
      this.content,
      this.doodle,
      this.icon,
      this.iconBackground});
}

List images;
const List data = [
  {
    "type" : "Workshop",
    "name": "Introdunction to Git and GitHub",
    "date": "2020-08-22",
    "time": "@9:00 AM",
    "Venue" : "Google Meet",
    "content":
        "Begineer level Workshop, where you can get the basic knowledge og Git and GitHub",
    "doodle": [
      "https://user-images.githubusercontent.com/57007680/89570906-73c6b700-d844-11ea-934f-3021f3bc83b3.png",
      "https://user-images.githubusercontent.com/57007680/89567754-cea9df80-d83f-11ea-852a-6be25409a84e.png",
      'https://user-images.githubusercontent.com/57007680/89299883-fa349a80-d684-11ea-99b1-10d3d01573d4.jpeg',
      "https://images.unsplash.com/photo-1529397938791-2aba4681454f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80",
      "https://lh3.googleusercontent.com/ZTlbHDpH59p-aH2h3ggUdhByhuq1AfviGuoQpt3QqaC7bROzbKuARKeEfggkjRmAwfB1p4yKbcjPusNDNIE9O7STbc9C0SAU0hmyTjA=s660"
    ],
    "icon": Icon(
      const IconData(0xe900, fontFamily: 'Schyler'),
    ),
    "iconBackground": Colors.cyan
  },
  {
    "type" : "Seminar",
    "name": "A chitchat with Facebook Intern",
    "date": "2020-09-02",
    "Venue" : "YouTube",
    "time": "@9:00 AM",
    "content": "A friendly talk with the Facebook intern that How she got that chance to be an Intern",
    "doodle": [
      "https://user-images.githubusercontent.com/57007680/89572780-3d3e6b80-d847-11ea-825a-b7f86fc1df45.png",
      "https://user-images.githubusercontent.com/57007680/89457959-db68fd80-d783-11ea-82b3-41c999d2b641.png",
      "https://image.slidesharecdn.com/gitandgithubtalk-181122071434/95/introduction-to-git-and-github-1-638.jpg?cb=1542871408",
      "https://images.unsplash.com/photo-1533659124865-d6072dc035e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
      "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80",
    ],
    "icon": Icon(
      Icons.exposure,
      color: Colors.white,
    ),
    "iconBackground": Colors.redAccent
  },
  {
    "type" : "Workshop",
    "name": "Al-Bīrūnī",
    "date": "2020-08-05",
    "time": "@9:00 AM",
    "Venue" : "Google Meet",
    "content":
        "Biruni is regarded as one of the greatest scholars of the Golden Age of Muslim civilisation",
    "doodle": [
      "https://user-images.githubusercontent.com/57007680/89572780-3d3e6b80-d847-11ea-825a-b7f86fc1df45.png",
      "https://lh3.googleusercontent.com/bFwiXFZEum_vVibMzkgPlaKZMDc66W-S_cz1aPKbU0wyNzL_ucN_kXzjOlygywvf6Bcn3ipSLTsszGieEZTLKn9NHXnw8VJs4-xU6Br9cg=s660",
    ],
    "icon": Icon(
      Icons.account_balance,
      color: Colors.black87,
    ),
    "iconBackground": Colors.amber
  },
  {
    "type" : "Workshop",
    "name": "Ibn Sina (Avicenna)",
    "date": "2020-08-05",
    "Venue" : "Google Meet",
    "time": "@9:00 AM",
    "content":
        "Avicenna (Ibn Sīnā) was a Persian polymath who is regarded as one of the most significant physicians, ",
    "doodle": [
      "https://www.google.com/logos/doodles/2018/ibn-sinas-1038th-birthday-5768556863029248.2-2x.png",
    ],
    "icon": Icon(
      Icons.healing,
      color: Colors.white,
    ),
    "iconBackground": Colors.green
  },
  {
    "type" : "Seminar",
    "name": "Ibn Rushd (Averroes)",
    "date": "2020-08-05",
    "time": "@9:00 AM",
    "Venue" : "Google Meet",
    "content":
        "Averroes was an Andalusian philosopher and thinker who wrote about many subjects, ",
    "doodle": [
      "https://lh3.googleusercontent.com/vk5ODrDXkJXCJ9z2lMnQdMb9m5-HKxDvn_Q67J8PBKPT9n67iCQFj37tB62ARaQQKnKwig-CcBT9NODmzoqdM56_UTUKZRELLYoz1lVU=s800",
    ],
    "icon": Icon(
      Icons.blur_circular,
      color: Colors.white,
    ),
    "iconBackground": Colors.indigo
  },
  {
    "type" : "Workshop",
    "name": "Nasir al-Din Tusi",
    "date": "2020-08-05",
    "time": "@9:00 AM",
    "Venue" : "Google Meet",
    "content":
        "Tusi was a Persian polymath, architect, philosopher, physician, scientist, and theologian.",
    "doodle": [
      "https://lh3.googleusercontent.com/UBa5VOLYZNb9sqCZJeMrrS5ZW-KpDBZ7haT8aLPpHzeOZ8K_6TCP03_n-5VKIaewaRVqYkTF09OwvI4oQ2L2IqaUyWlTUkJb4E1uZF0=s660",
    ],
    "icon": Icon(
      Icons.category,
      color: Colors.white,
    ),
    "iconBackground": Colors.pinkAccent
  },
  // EventGallery(
  //     name: "Nasir al-Din Tusi",
  //     time: "1201 - 1274",
  //     content:
  //         "Tusi was a Persian polymath, architect, philosopher, physician, scientist, and theologian. He is often considered the creator of trigonometry as a mathematical discipline in its own right. Ibn Khaldun (1332–1406) considered Al-Tusi to be the greatest of the later Persian scholars.",
  //     doodle:
  //         "https://lh3.googleusercontent.com/UBa5VOLYZNb9sqCZJeMrrS5ZW-KpDBZ7haT8aLPpHzeOZ8K_6TCP03_n-5VKIaewaRVqYkTF09OwvI4oQ2L2IqaUyWlTUkJb4E1uZF0=s660",
  //     icon: Icon(
  //       Icons.category,
  //       color: Colors.white,
  //     ),
  //     iconBackground: Colors.pinkAccent),
  // EventGallery(
  //     name: "Ibn Battuta",
  //     time: "1304 - 1368",
  //     content:
  //         "Over a period of thirty years, Ibn Battuta visited most of the Islamic world and many non-Muslim lands, including North Africa, the Horn of Africa, West Africa, the Middle East, Central Asia, Southeast Asia, South Asia and China. Near the end of his life, he dictated an account of his journeys, titled A Gift to Those Who Contemplate the Wonders of Cities and the Marvels of Travelling (Tuḥfat an-Nuẓẓār fī Gharāʾib al-Amṣār wa ʿAjāʾib al-Asfār), usually simply referred to as The Travels (Rihla). This account of his journeys provides a picture of a medieval civilisation that is still widely consulted today.",
  //     doodle:

  //         "https://lh3.googleusercontent.com/429NetsPejpMgeXqZuA15mCFLQykowhHNnbkSa1L8SHq9Kp9De-EBPlmOknzJ_HRykzt5FPhwpju_M3uKeuZlKegwdRQSzrH8NfdwR_B=s660",

  //     icon: Icon(
  //       Icons.navigation,
  //       color: Colors.white,
  //       size: 32.0,
  //     ),
  //     iconBackground: Colors.deepPurpleAccent),
  // EventGallery(
  //     name: "Ibn Khaldun",
  //     time: "1332 - 1406",
  //     content:
  //         "He is widely considered as a forerunner of the modern disciplines of historiography, sociology, economics, and demography.\nHe is best known for his book, the Muqaddimah or Prolegomena ('Introduction'). The book influenced 17th-century Ottoman historians like Kâtip Çelebi, Ahmed Cevdet Pasha and Mustafa Naima, who used the theories in the book to analyse the growth and decline of the Ottoman Empire. Also, 19th-century European scholars acknowledged the significance of the book and considered Ibn Khaldun to be one of the greatest philosophers of the Middle Ages.",
  //     doodle:
  //         "https://lh3.googleusercontent.com/TegzHFZQYIfV4lYsaXsZ-CUE_9Lp6qbJZXpSRzTWeLkNiQh0xRbt5KsI4szxN9nUopbyH6d-8tkmV5NcUJtI0Ks79fh-D6nCrKEt5hxR=s660",
  //     icon: Icon(
  //       Icons.supervised_user_circle,
  //       color: Colors.white,
  //     ),
  //     iconBackground: Colors.teal),
  // EventGallery(
  //     name: "Piri Reis",
  //     time: "1465 - 1553",
  //     content:
  //         "He is primarily known today for his maps and charts collected in his Kitab-ı Bahriye (Book of Navigation), a book that contains detailed information on navigation, as well as very accurate charts (for their time) describing the important ports and cities of the Mediterranean Sea. He gained fame as a cartographer when a small part of his first world map (prepared in 1513) was discovered in 1929 at the Topkapı Palace in Istanbul. His world map is the oldest known Turkish atlas showing the New World, and one of the oldest maps of America still in existence anywhere (the oldest known map of America that is still in existence is the map drawn by Juan de la Cosa in 1500). Piri Reis' map is centered on the Sahara at the latitude of the Tropic of Cancer.",
  //     doodle:
  //         "https://lh3.googleusercontent.com/9tn671PjT5omvyhJ6xEIiTkkw4ck0vaTeHpyOtwCOE-SEumZbBdKLVFm2sKFRJ6Gkq_uPtYP2Fbss7yxkXgH6IJQruo4c4JT9iILFJZP8A=s660",
  //     icon: Icon(
  //       Icons.map,
  //       color: Colors.white,
  //       size: 32.0,
  //     ),
  //     iconBackground: Colors.blue),
];
