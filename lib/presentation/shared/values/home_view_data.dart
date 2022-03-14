import 'package:landing_page_template/presentation/views/home_view.dart';

import '../../views/about_view.dart';
import '../../views/blog_view.dart';
import '../../views/contact_view.dart';
import '../../views/portfolio_view.dart';
import '../../views/skills_view.dart';
import '../../views/view_data.dart';

class HomeViewData {
  static final List<ViewData> views = [
    ViewData(title: 'home', view: const HomeView()),
    ViewData(title: 'about', view: const AboutView()),
    ViewData(title: 'skills', view: const SkillsView()),
    ViewData(title: 'portfolio', view: const PortfolioView()),
    ViewData(title: 'contact', view: const ContactView()),
    ViewData(title: 'blog', view: const BlogView()),
  ];
}
