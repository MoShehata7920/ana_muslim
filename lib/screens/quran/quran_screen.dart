import 'package:ana_muslim/models/sura_model.dart';
import 'package:ana_muslim/resources/assets_manager.dart';
import 'package:ana_muslim/resources/routes_manager.dart';
import 'package:ana_muslim/resources/strings_manager.dart';
import 'package:ana_muslim/widgets/custom_screen_top.dart';
import 'package:flutter/material.dart';

class QuranScreen extends StatelessWidget {
  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreenTop(
      topIcon: ImageAssets.quranIcon,
      screenTitle: AppStrings.quranElKareem,
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
              Navigator.pushNamed(context, Routes.suraRoute,
                  arguments: SuraModel(_suraName[index], index));
            },
            child: Center(
                child: Text(_suraName[index],
                    style: const TextStyle(fontSize: 20))),
          );
        },
        itemCount: _suraName.length,
      ),
    );
  }

  final List<String> _suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
}
