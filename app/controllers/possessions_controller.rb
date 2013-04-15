class PossessionsController < ApplicationController

	def index
	  @possessions = Possession.all
  end

    def new
    	if params[:code]
      # acknowledge code and get access token from FB
      session[:access_token] = session[:oauth].get_access_token(params[:code])      
      end   

       # auth established, now do a graph call:
        
      @api = Koala::Facebook::API.new(session[:access_token])
      # flash[:session] = session[:oauth] 
      @possession = Possession.new
      @friends = @api.fql_query("select uid, name, pic_square from user where uid in (select uid2 from friend where uid1 = me())")
      flash[:api] = @api
      begin
        @graph_data = @api.get_connections("me","friends")
      rescue Exception=>ex
        puts ex.message
      end
      
      
      # update/save user's fb info
      begin
        me = @api.get_object("/me")
        user = User.find_by_fbid(me["id"])

        if user
          user.name = me["name"]
          user.access = session[:access_token]
          user.fbid = me["id"]
          user.coins = 100
          user.money = 0
          user.save
        else
            user = User.new(:access=>session[:access_token], :name=>me["name"],:fbid=>me["id"], :coins => 100, :money => 0)
            user.save
        end
        flash[:user] = user
        @user =user
        @possession.user_id = use.id
        rescue Exception=>ex
        puts ex.message
      end
      
      respond_to do |format|
       format.html {   }       
      end
    end 

    def create

      @possession = Possession.new(params[:possession])
      
        if @possession.save
          url_post_to_wall = session[:oauth].url_for_dialog("feed", :to => @possession.user_invited_id)
          redirect_to url_post_to_wall
        else
          @user = flash[:user]
          @friends = flash[:api].fql_query("select uid, name, pic_square from user where uid in (select uid2 from friend where uid1 = me())")
          render 'new'
        end
    end

    def show
    	 @possession = Possession.find(params[:id])
	    
    end

    

    def destroy
      @possession = Possession.find(params[:id])
      @possession.destroy
      redirect_to possessions_url
    end
  end

