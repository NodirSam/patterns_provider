import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/create_view_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);
  static const String id="create_page";

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  CreateViewModel viewModel = CreateViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post',style: TextStyle(color: Colors.white,fontSize: 20),),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CreateViewModel>(
          builder: (ctx, model, index) => Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Title",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      // #title
                      TextField(
                        controller: viewModel.titleTextEditingController,
                        style: const TextStyle(color: Colors.black, fontSize: 30),
                        decoration: const InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(color: Colors.blue, fontSize: 20),
                          //border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: 50,),
                      const Text("Content",style: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 10,),
                      // #body
                      TextField(
                        controller: viewModel.bodyTextEditingController,
                        style: const TextStyle(color: Colors.black, fontSize: 30),
                        decoration: const InputDecoration(
                          hintText: "Body",
                          hintStyle: TextStyle(color: Colors.blue, fontSize: 20),
                          //border: InputBorder.none,
                        ),
                      ),
                      const SizedBox(height: 50,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueAccent
                        ),
                        width: 160,
                        height: 100,
                        child: TextButton(
                          onPressed: (){},//_apiPostCreate();
                          child: const Text("Add",style: TextStyle(color: Colors.white,fontSize: 30),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              viewModel.isLoading ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
            ],
          ),
        ),
      )
    );
  }
}