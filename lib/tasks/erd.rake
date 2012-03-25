namespace :erd do

  desc "Generate an ERD with custom options"
  task :create => :environment do

    # http://rails-erd.rubyforge.org/customise.html
    ENV['attributes'] = 'foreign_keys,primary_keys,timestamps,inheritance,content'
    ENV["filename"] = 'doc/erd'
    ENV["inheritance"] = 'true'
    ENV["notation"] = 'bachman'
    ENV["polymorphism"] = 'true'

    Rake::Task['erd'].invoke
  end

end
