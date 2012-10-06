include ApplicationHelper

class IdeasController < ApplicationController
  before_filter :restrict_access, :only => [:index, :show, :edit, :update, :destroy]

  def restrict_access
    redirect_to root_path
  end

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  


  # POST /ideas
  # POST /ideas.json
  def create
    idea_params = params.to_query
    create_idea_string = "#{request.host}/approved_create?#{idea_params}"

    
    

    #validate idea
    @idea = Idea.new(params[:idea])
    if @idea.valid?
      #send approval email with correct params
      IdeaMailer.approve_idea_email(@idea, create_idea_string).deliver

      #redirect to home, with a flash of success. NEED to do this, so user can't refresh page and spam email me
      flash[:success] = "Idea submitted for approval. If approved, you will receive an email with #{NUM_IDEAS} ideas"
      redirect_to root_path
    else
      render action: "new"
    end
    
  end

  def approved_create
    
    #logger.debug("in approved_create: #{params}")
    @idea = Idea.new(params[:idea])

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }

        #send submitter an email, with 5 random ideas
        idea_ids = (Idea.first.id..Idea.last.id).to_a.sample NUM_IDEAS 
        body_string = "<p>Congratulations, your idea was approved. As a reward, here are #{NUM_IDEAS} random ideas from our database: </p>"
        idea_ids.each do |id|
          cur_idea = Idea.find_by_id(id)
          body_string = body_string + "<p>Name: #{cur_idea.name}<br>#{cur_idea.description}</p>"
        end

        #email logic

      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end



end
