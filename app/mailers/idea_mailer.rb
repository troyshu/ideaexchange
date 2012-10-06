class IdeaMailer < ActionMailer::Base
  default from: "ideavendingmachine@gmail.com"
  def approve_idea_email(idea, create_idea_string)
    @idea = idea
    @create_idea_string = create_idea_string
    mail(:to => "ideavendingmachine@gmail.com", :subject => "Idea Vending Machine: approval needed for new idea")
  end
end
