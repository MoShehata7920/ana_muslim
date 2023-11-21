import 'package:flutter/material.dart';

import 'package:ana_muslim/models/doaa_model.dart';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/routes_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/widgets/custom_screen_top.dart';

class AdyaScreen extends StatelessWidget {
  AdyaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreenTop(
      topIcon: ImageAssets.doaaIcon,
      screenTitle: Text(
        AppStrings.adya,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      screenBody: screenBody(),
    );
  }

  Widget screenBody() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Color(0xFFB7935F),
            thickness: 1,
            endIndent: 40,
            indent: 40,
          );
        },
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.doaaRoute,
                  arguments: DoaaModel(_doaaName[index], index));
            },
            child: Center(
                child: Text(_doaaName[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20))),
          );
        },
        itemCount: _doaaName.length,
      ),
    );
  }

  final List<String> _doaaName = [
    "أذكار الصباح",
    "أذكار المساء",
    "أذكار بعد السلام من الصلاة المفروضة",
    "الْأدْعِيَةُ القرآنية",
    "أدعية الأنبياء من القرآن الكريم",
    "أذكار النوم",
    "أذكار الإستيقاظ",
    "دعاء السفر",
    "دعاء المقيم للمسافر",
    "دعـاء صـلاة الاستخـارة",
    "دعاء العطاس",
    "دعـاء سجود التلاوة",
    "دعـــــاء الاستفــتــــاح",
    "دعاء دخول السوق",
    "سيد الاستغفار",
    "الدعـــاء إذا أحسست بوجع في جسدك",
    "دعاء لقاء العدو وذي السلطان",
    "كفارة المجلس",
    "دعـاء الخوف من الشــرك",
    "دعاء الهم والحزن",
    "دعاء الكرب",
    "أذكار عند سماع الآذان",
    "أذكار بعد سماع الآذان",
    "أذكار ما بين الأذان والإقامة",
    "دُعَاءُ الذَّهَابِ إلَى المَسْجِدِ",
    "دُعَاءُ دُخُولِ المَسْجِدِ",
    "دُعَاءُ الخُرُوجِ مِنَ المَسْجِدِ",
    "الذكر قبل الوضوء",
    "الذكر بعد الوضوء",
    "أذكار الدخول إلى المنزل",
    "أذكار الخروج من المنزل",
    "أذكار دخول وخروج الخلاء",
    "أذكار الحج والعمرة",
    "الذكر عند الاحرام",
    "دعاء التلبية في الحج والعمرة",
    "الدعاء عند رؤية الكعبة",
    "الدعاء عند استلام الحجر الأسود",
    "الدُّعاءُ بينَ الرُّكن اليماني والحجر الأسود",
    "الدعاء في الطواف",
    "الدعاء بعد ركعتي الطواف",
    "الدعاء عند صعود الصَّفَا والمروة",
    "الدعاء على الصفا",
    "الدعاء في السعي بين الصفا والمروة",
    "الدعاء بعرفات",
    "دعاء السلف الصالح في عرفات",
    "الدعاء عند رمي جمرة العقبة عِنْدَ كُلِّ حَصَاة",
    "دعاء الرجوع من الحج أو العمرة",
    "دُعَاءُ خَتْمِ القُرْآنِ الكَريمِ",
    "أدعية للمتوفى (ذكور)",
    "أدعية للمتوفية (إناث)",
    "أدعية للميّت الطفل الصغير (ذكر أو أنثى)",
    "الدّعاء للميّت في صّلاة الجنازة",
    "أدعية لمغفرة الذنوب",
    "أدعية للوالدين",
    "أدعية للزوج أو الزوجة",
    "أدعية للأبناء",
    "أدعية للأصدقاء",
  ];
}
