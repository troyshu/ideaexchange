require 'csv'

namespace :db do
  desc "Import sample ideas from csv file"
  task :import => [:environment] do

    file = "db/ideas.txt"

    CSV.foreach(file, :headers => true, :col_sep => "\t") do |row|
      Idea.create!(
        :name => row[0],
        :description => row[1],
        :submitter_email => row[2]
        )
    end
  end
end