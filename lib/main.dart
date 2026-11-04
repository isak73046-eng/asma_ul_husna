import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

void main() => runApp(const AsmaApp());

const kGreen = Color(0xFF0B5D4B);
const kDark = Color(0xFF063B30);
const kGold = Color(0xFFD4AF37);
const kBg = Color(0xFFF4F7F5);

class AsmaApp extends StatelessWidget {
  const AsmaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'اسماء الحسنى',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: kGreen,
        scaffoldBackgroundColor: kBg,
      ),
      builder: (c, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      home: const SplashPage(),
    );
  }
}

class AllahName {
  final int no;
  final String ar, tr, meaning, benefit;
  const AllahName(this.no, this.ar, this.tr, this.meaning, this.benefit);

  String get shareText =>
      '$ar ($tr)\n\nمعنا: $meaning\nګټه: $benefit\n\n— اسماء الحسنى';
}

const String _raw = '''
الله|Allah|د ټولو جهانونو یوازینی رب او معبود|د ټول ذکر بنسټ؛ زړه ته آرام ورکوي
الرَّحْمَن|Ar-Rahman|ډېر مهربان|زړه نرموي او د الله په رحمت امید زیاتوي
الرَّحِيم|Ar-Rahim|تل رحم کوونکی|د توبې او امید لپاره ذکر
الْمَلِك|Al-Malik|ریښتینی پاچا|د مخلوق له بندګۍ زړه خلاصوي
الْقُدُّوس|Al-Quddus|ډېر پاک له هر عیب|د زړه او نیت پاکوالی
السَّلَام|As-Salam|د سلامتۍ مالک|د زړه آرام او امن
الْمُؤْمِن|Al-Mu'min|امن ورکوونکی|د ویرې او اندېښنې کمښت
الْمُهَيْمِن|Al-Muhaymin|ساتونکی او څارونکی|د الله د څارنې احساس
الْعَزِيز|Al-Aziz|غالب او ډېر عزتمن|عزت یوازې د الله له لوري غوښتل
الْجَبَّار|Al-Jabbar|ماتې جوړوونکی|د ماتو زړونو لپاره تسلي
الْمُتَكَبِّر|Al-Mutakabbir|د لوی عظمت خاوند|له تکبر څخه ځان ساتل
الْخَالِق|Al-Khaliq|پیدا کوونکی|د ځان او کائناتو په پیدایښت فکر
الْبَارِئ|Al-Bari'|له نیمګړتیا پاک جوړوونکی|د الله په صنعت باور
الْمُصَوِّر|Al-Musawwir|شکل ورکوونکی|د الله د ښکلا شکر
الْغَفَّار|Al-Ghaffar|ډېر پټوونکی او بخښونکی|د استغفار په وخت ورسره ذکر
الْقَهَّار|Al-Qahhar|بر ځواکمن|د ظالم په مقابل کې توکل
الْوَهَّاب|Al-Wahhab|ډېر بخښونکی|د دعا او غوښتنې په وخت
الرَّزَّاق|Ar-Razzaq|روزي ورکوونکی|په روزۍ کې توکل او حلال طلب
الْفَتَّاح|Al-Fattah|پرانیستونکی|د ستونزو د حل لپاره دعا
الْعَلِيم|Al-Alim|ډېر پوه|د علم او پوهې غوښتنه
الْقَابِض|Al-Qabid|نیونکی او تنګوونکی|په تنګۍ کې صبر
الْبَاسِط|Al-Basit|پراخوونکی|په فراخۍ کې شکر
الْخَافِض|Al-Khafid|ښکته کوونکی|د تکبر له زوال عبرت
الرَّافِع|Ar-Rafi'|پورته کوونکی|د درجو لپاره دعا
الْمُعِز|Al-Mu'izz|عزت ورکوونکی|په ایمان او طاعت عزت
الْمُذِل|Al-Mudhill|ذلیلوونکی|له ظلم او نافرمانۍ ځان ساتل
السَّمِيع|As-Sami'|ډېر اوریدونکی|دا باور چې الله دعا اوري
الْبَصِير|Al-Basir|ډېر لیدونکی|په پټو او ښکاره کې تقوا
الْحَكَم|Al-Hakam|حاکم او قاضي|په پرېکړو کې د الله حکم منل
الْعَدْل|Al-Adl|ډېر عادل|په عدالت قایمېدل
اللَّطِيف|Al-Latif|باریک بین او مهربان|په ستونزو کې د پټ لطف امید
الْخَبِير|Al-Khabir|د ټولو خبرو خبر|د اخلاص او رښتینولۍ یادونه
الْحَلِيم|Al-Halim|ډېر زغمونکی|په غصه کې حلم او صبر
الْعَظِيم|Al-Azim|ډېر لوی|د الله په عظمت زړه ډاډمن کېږي
الْغَفُور|Al-Ghafur|ډېر بخښونکی|د ګناه څخه توبه
الشَّكُور|Ash-Shakur|قدر کوونکی|په لږ عمل هم د ډېر اجر امید
الْعَلِي|Al-Ali|لوړ|زړه د الله لوری ته پورته کول
الْكَبِير|Al-Kabir|ډېر لوی|د دنیا کوچنیتوب پېژندل
الْحَفِيظ|Al-Hafiz|ساتونکی|د ځان او کورنۍ د ساتنې دعا
الْمُقِيت|Al-Muqit|ځواک او خوراک ورکوونکی|په اړتیا کې توکل
الْحَسِيب|Al-Hasib|حساب کوونکی او بسنه کوونکی|د آخرت د حساب یادونه
الْجَلِيل|Al-Jalil|بزرګ او باعظمت|په الله کې د بزرګۍ احساس
الْكَرِيم|Al-Karim|ډېر سخي|له الله څخه د ښه غوښتنې همت
الرَّقِيب|Ar-Raqib|څارونکی|د ګناه په وخت د الله یادول
الْمُجِيب|Al-Mujib|قبلوونکی|د دعا د قبلېدو امید
الْوَاسِع|Al-Wasi'|ډېر پراخ|د رحمت او روزۍ پراخوالی
الْحَكِيم|Al-Hakim|حکمتناک|په هر کار کې د الله حکمت لټول
الْوَدُود|Al-Wadud|ډېر مینه کوونکی|د الله مینه او د خلکو سره مینه
الْمَجِيد|Al-Majid|ډېر بزرګ|په ستاینه او تسبیح
الْبَاعِث|Al-Ba'ith|راپاروونکی|د بیا ژوندي کېدو باور
الشَّهِيد|Ash-Shahid|شاهد|په ریښتیا او امانت ټینګار
الْحَق|Al-Haqq|ریښتینی|د حق پیروي
الْوَكِيل|Al-Wakil|کارساز|په کارونو کې توکل
الْقَوِي|Al-Qawi|ډېر ځواکمن|د ایمان او ځواک غوښتنه
الْمَتِين|Al-Matin|ډېر کلک|په امتحان کې استقامت
الْوَلِي|Al-Wali|دوست او مرستندوی|د الله دوستۍ ته لار
الْحَمِيد|Al-Hamid|ستایل شوی|حمد او شکر
الْمُحْصِي|Al-Muhsi|هر څه شمېرونکی|د خپلو اعمالو محاسبه
الْمُبْدِئ|Al-Mubdi'|پیل کوونکی|د نوي پیل لپاره دعا
الْمُعِيد|Al-Mu'id|بیرته راګرځوونکی|د آخرت په یاد
الْمُحْيِي|Al-Muhyi|ژوندي کوونکی|د زړه د ژوندي کېدو لپاره
الْمُمِيت|Al-Mumit|مړه کوونکی|د مرګ یادونه
الْحَي|Al-Hayy|تل ژوندی|د ژوندي زړه لپاره
الْقَيُّوم|Al-Qayyum|پخپله ولاړ او نور ساتونکی|په سختۍ کې د الله پر مرسته تکیه
الْوَاجِد|Al-Wajid|هر څه موندونکی|د بې نیازۍ احساس
الْمَاجِد|Al-Majid|ډېر بزرګ|د الله د بزرګۍ ستاینه
الْوَاحِد|Al-Wahid|یو|د توحید ټینګول
الْأَحَد|Al-Ahad|یوازینی|له شرک څخه ځان ساتل
الصَّمَد|As-Samad|بې نیازه، ټول ورته اړتیا لري|یوازې له الله څخه غوښتنه
الْقَادِر|Al-Qadir|وس لرونکی|په الله باور چې هر څه کولای شي
الْمُقْتَدِر|Al-Muqtadir|بشپړ قدرت لرونکی|په ناهیلۍ کې امید
الْمُقَدِّم|Al-Muqaddim|مخکې کوونکی|د خیر په کارونو کې مخکې کېدل
الْمُؤَخِّر|Al-Mu'akhkhir|وروسته کوونکی|په ځند کې صبر
الْأَوَّل|Al-Awwal|لومړی، پرته له پیل|د الله په ازلیت فکر
الْآخِر|Al-Akhir|وروستی، پرته له پای|د فنا د دنیا یادونه
الظَّاهِر|Az-Zahir|ښکاره|په کائناتو کې د الله نښې لیدل
الْبَاطِن|Al-Batin|پټ، د ټولو پټو خبر|په خلوت کې تقوا
الْوَالِي|Al-Wali|د کارونو والي|د الله په تدبیر رضا
الْمُتَعَالِي|Al-Muta'ali|ډېر لوړ|له هر نقص څخه د الله پاکوالی
الْبَر|Al-Barr|ډېر نیکوکار|د نیکۍ او احسان زده کړه
التَّوَّاب|At-Tawwab|توبه قبلوونکی|په توبه کې ژر کول
الْمُنْتَقِم|Al-Muntaqim|له ظالمانو انتقام اخیستونکی|له ظلم څخه ځان ساتل
الْعَفُو|Al-Afuww|ډېر معاف کوونکی|په شپه د معافۍ غوښتنه
الرَّؤُوف|Ar-Ra'uf|ډېر نرم او مهربان|د نورو سره نرمي
مَالِكُ الْمُلْك|Malik-ul-Mulk|د ټول ملک مالک|په دنیا کې د ملکیت غرور پرېښودل
ذُو الْجَلَالِ وَالْإِكْرَام|Dhul-Jalali wal-Ikram|د عظمت او کرامت خاوند|د دعا په وخت ورسره غوښتنه
الْمُقْسِط|Al-Muqsit|په انصاف کوونکی|په انصاف رواج
الْجَامِع|Al-Jami'|راټولوونکی|د خلکو ترمنځ د یووالي دعا
الْغَنِي|Al-Ghani|بې نیازه|د خلکو له غوښتنې بې نیازي
الْمُغْنِي|Al-Mughni|بې نیازه کوونکی|د حلال روزۍ لپاره دعا
الْمَانِع|Al-Mani'|منع کوونکی|د بلا او شر له رد څخه دعا
الضَّار|Ad-Darr|ضرر پېښوونکی|یوازې د الله پر لاس باور
النَّافِع|An-Nafi'|ګټه رسوونکی|د ګټور علم او عمل غوښتنه
النُّور|An-Nur|رڼا|د زړه د رڼا لپاره دعا
الْهَادِي|Al-Hadi|هدایت کوونکی|د سمې لارې غوښتنه
الْبَدِيع|Al-Badi'|بې نمونې پیدا کوونکی|د الله په صنعت حیرانتیا
الْبَاقِي|Al-Baqi|تل پاتې|د فاني دنیا څخه عبرت
الْوَارِث|Al-Warith|د ټولو وارث|د نیکو اعمالو پرېښودل
الرَّشِيد|Ar-Rashid|سمې لارې ښودونکی|په کارونو کې د رشد غوښتنه
الصَّبُور|As-Sabur|ډېر صبر کوونکی|د صبر لپاره دعا
''';

final List<AllahName> kNames = () {
  final lines = _raw.trim().split('\n');
  final out = <AllahName>[];
  for (var i = 0; i < lines.length; i++) {
    final p = lines[i].split('|');
    out.add(AllahName(i + 1, p[0], p[1], p[2], p[3]));
  }
  return out;
}();

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _spin =
      AnimationController(vsync: this, duration: const Duration(seconds: 12))
        ..repeat();
  late final AnimationController _intro = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1800))
    ..forward();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3600), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => const HomePage(),
        transitionsBuilder: (_, a, __, child) =>
            FadeTransition(opacity: a, child: child),
      ));
    });
  }

  @override
  void dispose() {
    _spin.dispose();
    _intro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scale = CurvedAnimation(parent: _intro, curve: Curves.elasticOut);
    final fade = CurvedAnimation(
        parent: _intro, curve: const Interval(0.4, 1, curve: Curves.easeIn));
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kDark, kGreen, Color(0xFF0E7A62)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: scale,
              child: SizedBox(
                width: 190,
                height: 190,
                child: AnimatedBuilder(
                  animation: _spin,
                  builder: (_, __) => CustomPaint(
                    painter: StarPainter(_spin.value * 2 * math.pi),
                    child: const Center(
                      child: Text('الله',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 44,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            FadeTransition(
              opacity: fade,
              child: Column(children: [
                const Text('اسماء الحسنى',
                    style: TextStyle(
                        color: kGold,
                        fontSize: 34,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('د الله ج ښکلي نومونه',
                    style: TextStyle(
                        color: Colors.white.withOpacity(.85), fontSize: 16)),
                const SizedBox(height: 40),
                const SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(
                      strokeWidth: 2.5, color: kGold),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class StarPainter extends CustomPainter {
  final double angle;
  StarPainter(this.angle);

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.width / 2 - 6;
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..color = kGold;

    void square(double rot, double rad) {
      final path = Path();
      for (var i = 0; i < 4; i++) {
        final a = rot + i * math.pi / 2;
        final o = Offset(c.dx + rad * math.cos(a), c.dy + rad * math.sin(a));
        i == 0 ? path.moveTo(o.dx, o.dy) : path.lineTo(o.dx, o.dy);
      }
      path.close();
      canvas.drawPath(path, p);
    }

    square(angle + math.pi / 4, r);
    square(angle, r);
    square(-angle / 2 + math.pi / 4, r * .72);
    p.color = kGold.withOpacity(.4);
    canvas.drawCircle(c, r * .95, p);
  }

  @override
  bool shouldRepaint(StarPainter old) => old.angle != angle;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pc = PageController(viewportFraction: .86);
  int _page = 0;
  Timer? _timer;
  final List<AllahName> _featured = [
    kNames[1], kNames[0], kNames[16], kNames[14], kNames[17], kNames[44], kNames[81], kNames[92],
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_pc.hasClients) return;
      final next = (_page + 1) % _featured.length;
      _pc.animateToPage(next,
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pc.dispose();
    super.dispose();
  }

  void _copy(AllahName n) {
    Clipboard.setData(ClipboardData(text: n.shareText));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: const Text('کاپي شو'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: kGreen,
        duration: const Duration(seconds: 1),
      ));
  }

  void _share(AllahName n) => Share.share(n.shareText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: kGreen,
            foregroundColor: Colors.white,
            centerTitle: true,
            title: const Text('اسماء الحسنى',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          SliverToBoxAdapter(child: _slider()),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            sliver: SliverToBoxAdapter(
              child: Row(children: [
                Container(width: 4, height: 20, color: kGold),
                const SizedBox(width: 8),
                const Text('د الله ج ټول نومونه (٩٩)',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverList.builder(
              itemCount: kNames.length,
              itemBuilder: (_, i) => _tile(kNames[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _slider() {
    return Container(
      color: kGreen,
      padding: const EdgeInsets.only(bottom: 16, top: 4),
      child: Column(children: [
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _pc,
            itemCount: _featured.length,
            onPageChanged: (i) => setState(() => _page = i),
                        itemBuilder: (_, i) {
              final n = _featured[i];
              return AnimatedScale(
                scale: i == _page ? 1 : .92,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [kDark, Color(0xFF138A70)],
                    ),
                    border: Border.all(color: kGold, width: 1.6),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 12,
                          offset: Offset(0, 6))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(n.ar,
                          style: const TextStyle(
                              color: kGold,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(n.tr,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 14)),
                      const SizedBox(height: 10),
                      Text(n.meaning,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _featured.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: i == _page ? 22 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: i == _page ? kGold : Colors.white38,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _tile(AllahName n) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.06),
              blurRadius: 8,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration:
                const BoxDecoration(color: kGreen, shape: BoxShape.circle),
            child: Text('${n.no}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(n.ar,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kDark)),
                  Text(n.tr,
                      style: TextStyle(
                          fontSize: 13, color: Colors.grey.shade600)),
                ]),
          ),
          IconButton(
            tooltip: 'کاپي',
            onPressed: () => _copy(n),
            icon: const Icon(Icons.copy_rounded, color: kGreen),
          ),
          IconButton(
            tooltip: 'شیر',
            onPressed: () => _share(n),
            icon: const Icon(Icons.share_rounded, color: kGreen),
          ),
        ]),
        const Divider(height: 22),
        _line('معنا', n.meaning),
        const SizedBox(height: 6),
        _line('ګټه', n.benefit),
      ]),
    );
  }

  Widget _line(String label, String text) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
                color: kGold.withOpacity(.2),
                borderRadius: BorderRadius.circular(8)),
            child: Text(label,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7A6100))),
          ),
          const SizedBox(width: 8),
          Expanded(
              child: Text(text, style: const TextStyle(fontSize: 14.5, height: 1.5))),
        ],
      );
}
