class ContactsController < ApplicationController

  def index
      @contacts = Contact.order( name: :asc )
  end

  def show
    @contact = Contact.find( params[:id] )
  end

  def new
    @contact = Contact.new
  end

  def create
   @contact = Contact.new( contact_params )
   @contact.user = current_user

   if @contact.save
      flash[:success] = "New contact created successfully."
      redirect_to contacts_path
   else
      flash[:danger] = "Something went wrong:"
      render 'new'
   end
  end

  def edit
    @contact = Contact.find( params[:id] )
  end

  def update
    @contact = Contact.find( params[:id] )
    if @contact.update_attributes( contact_params )
      flash[:success] = "Contact updated successfully."
      redirect_to contacts_path
    else
      render 'edit'
    end
  end

  def destroy
   @contact = Contact.find( params[:id] )
   if @contact.destroy
     redirect_to root_path
   else
     redirect_to @contact
   end
  end

  def user
   @user = User.find( params[:user_id] )

   @contacts = Contact.where( user: @user ).order( name: :asc )

   @favourites = @user.favourites.joins( :contact ).order( "contacts.created_at DESC" )
  end

  private

   def contact_params
      params.require( :contact ).permit( :name, :phone, :email )
   end

end
