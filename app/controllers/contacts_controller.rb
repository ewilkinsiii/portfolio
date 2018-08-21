class ContactsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
  
  private
  
  def set_user
    @user = User.find(1)
    @address = @user.addresses[0]
  end
end