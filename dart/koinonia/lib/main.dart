import 'dart:async';
import 'dart:convert';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _CustomScrollViewExampleState();
}
class _CustomScrollViewExampleState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-list');
    List<String> books = ['Genesis',
'Exodus',
'Leviticus',
'Numbers',
'Deuteronomy',
'Joshua',
'Judges',
'Ruth',
'1 Samuel',
'2 Samuel',
'1 Kings',
'2 Kings',
'1 Chronicles',
'2 Chronicles',
'Ezra',
'Nehemiah',
'Esther',
'Job',
'Psalms',
'Proverbs',
'Ecclesiastes',
'Song of Solomon',
'Isaiah',
'Jeremiah',
'Lamentations',
'Ezekiel',
'Daniel',
'Hosea',
'Joel',
'Amos',
'Obadiah',
'Jonah',
'Micah',
'Nahum',
'Habakkuk',
'Zephaniah',
'Haggai',
'Zechariah',
'Malachi',
'Matthew',
'Mark',
'Luke',
'John',
'Acts',
'Romans',
'1 Corinthians',
'2 Corinthians',
'Galatians',
'Ephesians',
'Philippians',
'Colossians',
'1 Thessalonians',
'2 Thessalonians',
'1 Timothy',
'2 Timothy',
'Titus',
'Philemon',
'Hebrews',
'James',
'1 Peter',
'2 Peter',
'1 John',
'2 John',
'3 John',
'Jude',
'Revelation'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Journal'),
      ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                children: List.generate(books.length,(index) {
                  return GestureDetector(
                    // When the child is tapped, show a snackbar.
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChapterSelectPage(selected_book: books[index])),
                    );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      child: Text(books[index]),
                    )
                  );
                }),
              );
             },
            ),
          ),
        ],
      ),
    );
  }
}

class ChapterSelectPage extends StatelessWidget {
  const ChapterSelectPage({super.key, required this.selected_book});

  final String selected_book;  

  @override
  Widget build(BuildContext context) {
      // Declare a field that holds the Person data
    List<Map> booksData = [
        {
            "book": "Genesis",
            "verses": 1533,
            "chapters": 50 
        },
        {
            "book": "Exodus",
            "verses": 1213,
            "chapters": 40 
        },
        {
            "book": "Leviticus",
            "verses": 859,
            "chapters": 27 
        },
        {
            "book": "Numbers",
            "verses": 1288,
            "chapters": 36 
        },
        {
            "book": "Deuteronomy",
            "verses": 959,
            "chapters": 34 
        },
        {
            "book": "Joshua",
            "verses": 658,
            "chapters": 24 
        },
        {
            "book": "Judges",
            "verses": 618,
            "chapters": 21 
        },
        {
            "book": "Ruth",
            "verses": 85,
            "chapters": 4 
        },
        {
            "book": "1 Samuel",
            "verses": 810,
            "chapters": 31 
        },
        {
            "book": "2 Samuel",
            "verses": 695,
            "chapters": 24 
        },
        {
            "book": "1 Kings",
            "verses": 816,
            "chapters": 22 
        },
        {
            "book": "2 Kings",
            "verses": 719,
            "chapters": 25 
        },
        {
            "book": "1 Chronicles",
            "verses": 942,
            "chapters": 29 
        },
        {
            "book": "2 Chronicles",
            "verses": 822,
            "chapters": 36 
        },
        {
            "book": "Ezra",
            "verses": 280,
            "chapters": 10 
        },
        {
            "book": "Nehemiah",
            "verses": 406,
            "chapters": 13 
        },
        {
            "book": "Esther",
            "verses": 167,
            "chapters": 10 
        },
        {
            "book": "Job",
            "verses": 1070,
            "chapters": 42 
        },
        {
            "book": "Psalms",
            "verses": 2461,
            "chapters": 150 
        },
        {
            "book": "Proverbs",
            "verses": 915,
            "chapters": 31 
        },
        {
            "book": "Ecclesiastes",
            "verses": 222,
            "chapters": 12 
        },
        {
            "book": "Song of Solomon",
            "verses": 117,
            "chapters": 8 
        },
        {
            "book": "Isaiah",
            "verses": 1292,
            "chapters": 66 
        },
        {
            "book": "Jeremiah",
            "verses": 1364,
            "chapters": 52 
        },
        {
            "book": "Lamentations",
            "verses": 154,
            "chapters": 5 
        },
        {
            "book": "Ezekiel",
            "verses": 1273,
            "chapters": 48 
        },
        {
            "book": "Daniel",
            "verses": 357,
            "chapters": 12 
        },
        {
            "book": "Hosea",
            "verses": 197,
            "chapters": 14 
        },
        {
            "book": "Joel",
            "verses": 73,
            "chapters": 3 
        },
        {
            "book": "Amos",
            "verses": 146,
            "chapters": 9 
        },
        {
            "book": "Obadiah",
            "verses": 21,
            "chapters": 1 
        },
        {
            "book": "Jonah",
            "verses": 48,
            "chapters": 4 
        },
        {
            "book": "Micah",
            "verses": 105,
            "chapters": 7 
        },
        {
            "book": "Nahum",
            "verses": 47,
            "chapters": 3 
        },
        {
            "book": "Habakkuk",
            "verses": 56,
            "chapters": 3 
        },
        {
            "book": "Zephaniah",
            "verses": 53,
            "chapters": 3 
        },
        {
            "book": "Haggai",
            "verses": 38,
            "chapters": 2 
        },
        {
            "book": "Zechariah",
            "verses": 211,
            "chapters": 14 
        },
        {
            "book": "Malachi",
            "verses": 55,
            "chapters": 4 
        },
        {
            "book": "Matthew",
            "verses": 1071,
            "chapters": 28 
        },
        {
            "book": "Mark",
            "verses": 678,
            "chapters": 16 
        },
        {
            "book": "Luke",
            "verses": 1151,
            "chapters": 24 
        },
        {
            "book": "John",
            "verses": 879,
            "chapters": 21 
        },
        {
            "book": "Acts",
            "verses": 1007,
            "chapters": 28 
        },
        {
            "book": "Romans",
            "verses": 433,
            "chapters": 16 
        },
        {
            "book": "1 Corinthians",
            "verses": 437,
            "chapters": 16 
        },
        {
            "book": "2 Corinthians",
            "verses": 257,
            "chapters": 13  
        },
        {
            "book": "Galatians",
            "verses": 149,
            "chapters": 6 
        },
        {
            "book": "Ephesians",
            "verses": 155,
            "chapters": 6 
        },
        {
            "book": "Philippians",
            "verses": 104,
            "chapters": 4 
        },
        {
            "book": "Colossians",
            "verses": 95,
            "chapters": 4 
        },
        {
            "book": "1 Thessalonians",
            "verses": 89,
            "chapters": 5 
        },
        {
            "book": "2 Thessalonians",
            "verses": 47,
            "chapters": 3 
        },
        {
            "book": "1 Timothy",
            "verses": 133,
            "chapters": 6 
        },
        {
            "book": "2 Timothy",
            "verses": 83,
            "chapters": 4 
        },
        {
            "book": "Titus",
            "verses": 46,
            "chapters": 3 
        },
        {
            "book": "Philemon",
            "verses": 25,
            "chapters": 1 
        },
        {
            "book": "Hebrews",
            "verses": 303,
            "chapters": 13
        },
        {
            "book": "James",
            "verses": 108,
            "chapters": 5 
        },
        {
            "book": "1 Peter",
            "verses": 105,
            "chapters": 5 
        },
        {
            "book": "2 Peter",
            "verses": 61,
            "chapters": 3 
        },
        {
            "book": "1 John",
            "verses": 105,
            "chapters": 5 
        },
        {
            "book": "2 John",
            "verses": 13,
            "chapters": 1 
        },
        {
            "book": "3 John",
            "verses": 14,
            "chapters": 1 
        },
        {
            "book": "Jude",
            "verses": 25,
            "chapters": 1 
        },
        {
            "book": "Revelation",
            "verses": 404,
            "chapters": 22
        }
    ];
    // var list =  List(bookData.books);
    Map<dynamic, dynamic> bookData = booksData.firstWhere((book) => book['book'] == selected_book);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Journal'),
      ),
      body: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7, // number of items in each row
        mainAxisSpacing: 8.0, // spacing between rows
        crossAxisSpacing: 8.0, // spacing between columns
      ),
      
      itemCount: bookData['chapters'], // total number of items
      itemBuilder: (context, index) {
        return GestureDetector(
                    // When the child is tapped, show a snackbar.
                    onTap: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChapterReader(selectedBook: selected_book, selectedChapter: index.toString(),)),
                    );
                    },
                    child: Text(index.toString())
                  );
      },
    )
    // Column( children: [buildBookChapters(bookData['chapters'])] ,)
    );
  }
}

class ChapterReader extends MyApp {
  final String selectedBook;
  final String selectedChapter;
  const ChapterReader({super.key, required this.selectedBook, this.selectedChapter = ''});

  @override
    Widget build(BuildContext context) {
    
    String uri = 'https://api.scripture.api.bible/v1/bibles/06125adad2d5898a-01/chapters/';
    // print(fetchChapter('$uri$this.selected_book$this.selected_chapter'));
    // print(fetchChapter('$uri$this.selected_book$this.selected_chapter'));
    // Future<BookData> r = fetchBook('$booksUri').then((value) => value.firstWhere((bo) =>
    //   bo['name'] == selectedBook.toString()
    // )
    // );

    Future<String> response = fetchChapter('$uri$selectedBook.$selectedChapter', selectedBook, selectedChapter);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Journal'),
      ),
      body: Row(children: [FutureBuilder<String>(
      future: response,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          
  return Text(snapshot.data.toString());
        } else {
          return Text(response.toString());
        }
      }
      )]
      )
    );

  }
}

Future<List<dynamic>> fetchBook(String url) async {
  final response = await http
      .get(Uri.parse(url), headers: { 'api-key': 'ed4b5617b524bba6781eec3747e78914' });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print(response.body);
    var booksData = Book.fromJson(jsonDecode(response.body) as Map<String, dynamic>);

    return booksData.data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load album');
  }
}

Future<String> fetchChapter(String url, String selectedBook, String selectedChapter) async {
  List book;
  String booksUri = 'https://api.scripture.api.bible/v1/bibles/06125adad2d5898a-01/books';
  final response = await http
      .get(Uri.parse(url), headers: { 'api-key': 'ed4b5617b524bba6781eec3747e78914', 'language_code': 'eng' });
  List<dynamic> r = await fetchBook(booksUri).then((value) { 
    // value.firstWhere((bo) =>
    //       bo['name'] == selectedBook.toString()
    //     )
    book = value;
    return value;
  });

print(book[0]['name'] == selectedBook);
print(selectedBook);
  dynamic oBook = book.firstWhere((bo) =>
    bo['name'] == selectedBook
  );
  String bookId = oBook['id'];
  String chaptersUri = 'https://api.scripture.api.bible/v1/bibles/06125adad2d5898a-01/chapters/$bookId.$selectedChapter';
  final chaptersRes = await http
      .get(Uri.parse(chaptersUri), headers: { 'api-key': 'ed4b5617b524bba6781eec3747e78914', 'language_code': 'eng', 'Content-Type': 'application/json; charset=utf-8', 'access-control-expose-headers': 'WWW-Authenticate,Server-Authorization', 'Connection': 'keep-alive' });

  if (chaptersRes.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return jsonDecode(chaptersRes.body)['data']['content'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('Failed to load album');
  }
}

class ChapterData { 
  final String content;
  final String? id;
  final String? bibleId;
  final String? number;
  final String? bookId;
  final String? reference;
  final String? copyright;
  final int? verseCount;

  ChapterData({required this.content,
this.id,
this.bibleId,
this.number,
this.bookId,
this.reference,
this.copyright,
this.verseCount
});

factory ChapterData.fromJson(Map<String, dynamic> json) {
    return ChapterData(
      content: json['content'] as String,
    );
  }
}
class Chapter { 
  final ChapterData data;

  const Chapter({required this.data});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      data: json['data'] as ChapterData,
    );
  }

}

class BookData {
  final String? id;
  final String? bibleId;
  final String? abbreviation;
  final String? name;
  final String? nameLong;
  
  BookData({this.id, this.bibleId, this.abbreviation, this.name, this.nameLong});
}

class Book extends BookData{
  final List<dynamic> data;

  Book({required this.data});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(data: json['data']);
  }
}

Future<void> loadJsonAsset(assetString) async { 
  final String jsonString = await rootBundle.loadString(assetString); 
  final data = jsonDecode(jsonString); 
  return data;
}

Widget buildBookChapters(int chapterCount)
{
  
  return GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 7, // number of items in each row
    mainAxisSpacing: 8.0, // spacing between rows
    crossAxisSpacing: 8.0, // spacing between columns
  ),
  padding: const EdgeInsets.all(8.0), // padding around the grid
  itemCount: chapterCount, // total number of items
  itemBuilder: (context, index) {
    return Text(index.toString());
  },
);
}
