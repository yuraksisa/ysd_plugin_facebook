Gem::Specification.new do |s|
  s.name    = "ysd_plugin_facebook"
  s.version = "0.1.9"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2013-01-09"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "Facebook integration"
  s.summary = "Facebook integration"

  s.add_runtime_dependency "koala"
   
end