class RefsController < ApplicationController
  before_action :set_ref, only: [:show, :edit, :update, :destroy, :toggle_status, :like, :unlike]
  access all: [:show, :like, :unlike], site_admin: :all
  
  def new
    @ref = Ref.new
  end
  
  def create
    @ref = Ref.new(ref_params)

    respond_to do |format|
      if @ref.save
        format.html { redirect_to @ref, notice: 'Draft Reference was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def show
    if logged_in?(:site_admin) || @ref.published?
      @ref = Ref.friendly.find(params[:id])
      @years = Time.current.year - @ref.years_known
    else
      redirect_to refs_path, notice: "You are not authorized to access this page"
    end
  end

  def edit
  end


  def update
    respond_to do |format|
      if @ref.update(ref_params)
        format.html { redirect_to @ref, notice: 'Reference was successfully published.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ref.destroy
    respond_to do |format|
      format.html { redirect_to refs_url, notice: 'Reference was Removed.' }
    end
  end
  
  def toggle_status
    if @ref.draft?
      @ref.published!
    elsif @ref.published?
      @ref.draft!
    end
    redirect_to refs_url, notice: 'Post status has been updated.'
  end
  
  def like
    @ref.liked_by current_user
    redirect_to about_me_path + "#reference", notice: "Saved Like" 
  end
  
  def unlike
    @ref.unliked_by current_user
    redirect_to about_me_path + "#reference", notice: "Removed Like"
  end
  
  private
  
   def set_ref
      @ref = Ref.friendly.find(params[:id])
    end
  
  def ref_params
    @user = User.first
    params.require(:ref).permit(:name,
                                :email,
                                :may_contact,
                                :comment,
                                :years_known,
                                :company,
                                :project,
                                :code,
                                :relationship_id,
                                :user_id,
                                :status
                              )
  end
end