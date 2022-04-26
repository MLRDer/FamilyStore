import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:store/components/app/pay_and_buy_button.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/styles.dart';

class PaymentPage extends StatefulWidget {
  final int price;
  const PaymentPage({Key? key, required this.price}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {
  bool isPaid = false;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);

    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  void toggle() {
    setState(() {
      isPaid = !isPaid;
    });
  }

  @override
  Widget build(BuildContext context) {
    int price = widget.price;
    TextEditingController numberController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    void showPaidDialog() => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset("assets/animations/success.json",
                    repeat: false,
                    controller: animationController, onLoaded: (composition) {
                  animationController.duration = composition.duration;
                  animationController.forward();
                }),
                const Text(
                  "Buyurtmangiz uchun rahmat! Mahsulotlarni tez orada yetqizib beramiz!",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        );

    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text("Karta ma'lumotlari",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: detailImageBorder)),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Karta raqami:",
                  style: TextStyle(fontSize: 14, color: kTextLightColor),
                ),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: detailImageBorder, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: detailImageBorder, width: 1)),
                    hintText: "0000 0000 0000 0000",
                    hintStyle: const TextStyle(color: kTextLightColor),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: detailImageBorder,
                      ),
                      onPressed: () {
                        numberController.text = "";
                      },
                    ),
                  ),
                  controller: numberController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Yaroqlilik muddati:",
                  style: TextStyle(fontSize: 14, color: kTextLightColor),
                ),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: detailImageBorder, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: detailImageBorder, width: 1)),
                    hintText: "MM/YY",
                    hintStyle: const TextStyle(color: kTextLightColor),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: detailImageBorder,
                      ),
                      onPressed: () {
                        dateController.text = "";
                      },
                    ),
                  ),
                  controller: dateController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Karta egasi:",
                  style: TextStyle(fontSize: 14, color: kTextLightColor),
                ),
                TextField(
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: detailImageBorder, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: detailImageBorder, width: 1)),
                    hintText: "Eshmatov Toshmat",
                    hintStyle: const TextStyle(color: kTextLightColor),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.cancel,
                        color: detailImageBorder,
                      ),
                      onPressed: () {
                        nameController.text = "";
                      },
                    ),
                  ),
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Havfsizlik nuqtai nazaridan sizning karta ma'lumotlariningiz saqlanmasligi va boshqa shaxslarga tarqatilmasligi kafolatlanadi!",
                  style: TextStyle(fontSize: 12, color: kTextLightColor),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Umumiy to'lov summasi: $price so'm",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                payAndBuyButton(isPaid ? "To'landi" : "To'lash", () {
                  showPaidDialog();
                  toggle();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(gradient: appMainGradient),
    ),
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(
      "To'lov",
      style: appBarTitleStyle,
    ),
  );
}