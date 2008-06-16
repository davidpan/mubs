# 需要安装Erubis gem支持, sudo gem install erubis -y
# This will replace ERB in Rails by Erubis entirely.
# Erubis渲染速度远快于ERB,尚有其它附加功能,详见  http://www.kuwata-lab.com/erubis/
require 'erubis/helpers/rails_helper'
#Erubis::Helpers::RailsHelper.engine_class = Erubis::Eruby # or Erubis::FastEruby
# Erubis::Helpers::RailsHelper.init_properties = {:escape => true, :escapefunc => 'h' }
Erubis::Helpers::RailsHelper.show_src = false
Erubis::Helpers::RailsHelper.preprocessing = true

# Erubis::Helpers::RailsHelper.engine_class (=Erubis::Eruby)
# 
#     Erubis engine class (default Erubis::Eruby).
# Erubis::Helpers::RailsHelper.init_properties (={})
# 
#     Optional arguments for Erubis::Eruby#initialize() method (default {}).
# Erubis::Helpers::RailsHelper.show_src (=nil)
# 
#     Whether to print converted Ruby code into log file. If true, Erubis prints coverted code into log file. If false, Erubis doesn't. If nil, Erubis prints when ENV['RAILS_ENV'] == 'development'. Default is nil.
# Erubis::Helpers::RailsHelper.preprocessing (=false)
# 
#     Enable preprocessing if true (default false).
