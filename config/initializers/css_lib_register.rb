# <link rel="stylesheet" href="blueprint/screen.css" type="text/css" media="screen, projection">
# <link rel="stylesheet" href="blueprint/print.css" type="text/css" media="print"> 
# <!--[if IE]><link rel="stylesheet" href="blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :bps => ['blueprint/screen.css'] # blueprint css framework

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :bpp => ['blueprint/print.css'] # blueprint css framework
