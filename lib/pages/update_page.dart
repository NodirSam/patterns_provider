import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/update_view_model.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({required this.title, required this.body});

  static const String id = "update_page";

  String title;
  String body;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  UpdateViewModel viewModel = UpdateViewModel();

  @override
  void initState() {
    super.initState();

    viewModel.titleTextEditingController.text = widget.title;
    viewModel.bodyTextEditingController.text = widget.body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<UpdateViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Column(
                      children: [
                        const Text(
                          "Title",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //title
                        Container(
                          child: TextField(
                            controller: viewModel.titleTextEditingController,
                            style: const TextStyle(color: Colors.black, fontSize: 30),
                            decoration: InputDecoration(
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        const Text(
                          "Body",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //body

                        Container(
                          height: 150,
                          width: double.infinity,
                          child: TextField(
                            maxLines: null,
                            controller: viewModel.bodyTextEditingController,
                            style: const TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        ),

                        const SizedBox(
                          height: 80,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueAccent),
                          width: 160,
                          height: 100,
                          child: TextButton(
                            onPressed: () {
                              viewModel.apiPostUpdate(context);
                            }, //apiPostUpdate();
                            child: const Text(
                              "Update",
                              style: TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              viewModel.isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      )
    );
  }
}