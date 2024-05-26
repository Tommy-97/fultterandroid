import 'package:flutter/material.dart';
import '../services/search_service.dart';
import '../models/song.dart';
import '../widgets/song_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final SearchService _searchService = SearchService();
  List<Song> _searchResults = [];
  bool _isLoading = false;

  void _searchSongs() async {
    setState(() {
      _isLoading = true;
    });
    List<Song> results = await _searchService.searchSongs(_searchController.text);
    setState(() {
      _searchResults = results;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Songs'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter song title or artist',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchSongs,
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _searchResults.isEmpty
                    ? Center(child: Text('No results found'))
                    : ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          return SongItem(song: _searchResults[index]);
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
