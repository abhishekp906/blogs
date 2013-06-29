namespace :tutes do
  desc "Import episode names and episode numbers for adding search functionality."
  task :all => :environment do
    ["pro", "revised", "free"].each do |type|
      Dir["public/railscasts/#{type}/*.mp4"].map{ |a| File.basename(a) }.each do |file|
        puts file
        Tute.create(:title => file.split(".")[0].split("-")[1..-1].join(" ").capitalize, :episode => file.split("-")[0], :general_type => type, :video_link => "railscasts/#{type}/#{file}", :read_link => "railscasts/#{type}/asciicasts/#{file.split(".")[0]}.html" )
      end
    end
  end
end
