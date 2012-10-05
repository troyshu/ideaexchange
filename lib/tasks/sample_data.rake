namespace :db do
  desc "Fill database with sample ideas"
  task populate: :environment do
    Idea.create!(name: "Example User",
                 description: "example@railstutorial.org") 
  end
end