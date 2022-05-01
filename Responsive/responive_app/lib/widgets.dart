import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Image.network("https://picsum.photos/300",fit: BoxFit.cover,)
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => const DetailPage()));
      },
      child: Container(
        height: 300,
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
        padding: const EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 3),
        decoration: const BoxDecoration(

            boxShadow: [
              BoxShadow(
                  offset: Offset(4, 3),
                  blurRadius: 16,
                  color: Colors.black26)
            ],
            borderRadius:
            BorderRadius.all(Radius.circular(40)),
            color: Colors.blue),
        child: ClipRRect(
            borderRadius:
            const BorderRadius.all(Radius.circular(40)),
            child: Image.network("https://picsum.photos/300",fit: BoxFit.cover,)),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = '''
    Lorem ipsum dolor sit amet. Eum quia distinctio qui exercitationem dolore ut architecto commodi ea provident iusto ad soluta laborum. Porro expedita rem suscipit reiciendis sed illo numquam et necessitatibus suscipit id consectetur voluptatem At inventore molestias. Eum saepe nisi id ducimus Quis non doloremque pariatur aut officia voluptatem. Aut aliquid iste ut esse voluptatem eum asperiores earum sed error magnam.

Qui iusto molestiae 33 facere adipisci eos dolorum maiores. Aut recusandae dolorum At numquam ipsa ut similique pariatur qui iure reprehenderit et autem voluptate. Non internos voluptas est dolorem natus id amet voluptatem numquam eaque ut sint harum qui adipisci velit aut perspiciatis possimus? Et sunt velit ut architecto beatae sed error officia sed obcaecati beatae.

Ea minus expedita et velit vitae ab quas provident 33 libero quis sed itaque velit est quaerat quia? Qui libero adipisci qui quam velit et sunt odio sed iusto omnis in consectetur incidunt est veniam tempore ad esse dolorum. Et temporibus molestias in inventore esse sit quas unde ut itaque debitis eos facere temporibus fugiat nostrum aut delectus aspernatur.
    ''';
    return Text(text);
  }
}
