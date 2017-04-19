class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills= Skill.all
  end

  def about
  end
  
  def contact
  end
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to contact_path
    else
      flash.now[:error] = 'Cannot send message.'
      #render :new
    end
  end
  
end
