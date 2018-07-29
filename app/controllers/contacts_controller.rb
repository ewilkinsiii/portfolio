class ContactsController < ApplicationController
  def new
    @user = User.find(1)
    @address = @user.addresses[0]
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
end