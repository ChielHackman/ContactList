class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    @user = current_user
    @favourites = @user.favourites.all
    @friends = @user.friends.all
    @familys = @user.familys.all
    @works = @user.works.all
    @contact = Contact.new
  end

  def show
    @contact = Contact.find_by_name( params[:id] )
  end

  def new
    @contact = Contact.new
  end

  def create
   @contact = Contact.new( contact_params )
   @contact.user = current_user

   if @contact.save
      flash[:success] = "New contact created successfully."
      redirect_to root_path
   else
      flash[:danger] = "Something went wrong:"
      render 'new'
   end
  end

  def edit
    @contact = Contact.find( params[:id] )
  end

  def update
    @contact = Contact.find_by_name( params[:id] )
    @contact.update_attributes( contact_params )
    if @contact.save
      flash[:success] = "Contact updated successfully."
      redirect_to contact_path
    else
      render 'edit'
    end
  end

  def destroy
   @contact = Contact.find_by_name( params[:id] )
   if @contact.destroy
     redirect_to root_path
   else
     redirect_to @contact
   end
  end

  def user
   @user = User.find( params[:user_id] )
   @contacts = Contact.where( user: @user )
   @favourites = @user.favourites.joins( :contact )
  end

  def favourites
    @favourites = Favourite.all
    @user = User.find( params[:user_id] )
    @contact = Contact.find_by_name( params [:id] )
  end

  def works
    @works = Work.all
    @user = User.find( params[:user_id] )
    @contact = Contact.find_by_name( params [:id] )
  end

  def familys
    @familys = Family.all
    @user = User.find( params [:user_id] )
    @contact = Contact.find_by_name( params [:id] )
  end

  def friends
    @friends = Friend.all
    @user = User.find( params [:user_id] )
    @contact = Contact.find_by_name( params [:id] )
  end

  private

   def contact_params
      params.require( :contact ).permit( :name, :address, :postalcode, :city, :phone, :email, :image )
   end

end
