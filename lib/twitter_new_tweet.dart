import 'package:first/Providers/new_post_provider.dart';
import 'package:first/Providers/posts_provider.dart';
import 'package:first/twitter_footer.dart';
import 'package:first/twitter_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'class/Tweet.dart';

class NewTweet extends StatelessWidget {
  NewTweet({super.key});

  final _newPostForm = GlobalKey<FormState>();
  Tweet newTweet = Tweet(99,"","");


  Future<void> _selectDate(BuildContext context, DateTime selectedDate) async {

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      updateDate(context, picked);
    }
  }

  void updateDate(BuildContext context, DateTime newDate){
    context.read<NewPostsProvider>().updateDate(newDate);
  }


  @override
  Widget build(BuildContext context) {

    final itemSelected = context.watch<NewPostsProvider>().itemSelected();
    final items = context.watch<NewPostsProvider>().items();
    final selectedDate = context.watch<NewPostsProvider>().selectedDate();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
                width: 40,
                height: 40,
                child: Image.network(
                    'https://cdn-icons-png.freepik.com/256/13051/13051786.png')
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Twitter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(88, 176, 240, 1),
      ),
      body: Column(
        children: [
          Header(),
          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _newPostForm,
              child: Column(
              children: [
                TextFormField(
                  onSaved: (value) {
                    newTweet.author = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Author :'
                  ),
                    validator: (value) {
                    if (value!.isEmpty){
                      return 'Please enter field';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onSaved: (value) {
                    newTweet.message = value!;
                  },
                    decoration: const InputDecoration(
                    labelText: 'New post',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  autofocus: true,
                    validator: (value) {
                      if (value!.isEmpty){
                        return 'Please enter field';
                      }
                      return null;
                    }
                ),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  value: itemSelected,
                  onChanged: (newValue) {
                    context.read<NewPostsProvider>().selectItem(newValue!);
                    newTweet.category = newValue;
                  },
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "${selectedDate.toLocal()}".split(' ')[0],
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context, selectedDate),
                    child: const Text('Select date'),
                  ),
                ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    validate(context);
                  },
                  child: const Text('Post'),
                ),
              ],
            ),
            ),
          ),
          ),
          const Footer(),
        ],
      ),
    );
  }

  void validate(BuildContext context){
    if (_newPostForm.currentState?.validate() == true) {
      _newPostForm.currentState?.save();
      Tweet tweet = context.read<NewPostsProvider>().newTweet(newTweet);
      context.read<PostsProvider>().addPost(tweet);
      Navigator.pop(context);
    }
  }

}
