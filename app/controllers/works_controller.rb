class WorksController < ApplicationController
  def create
   contact = Contact.find_by_name( params[:contact_id] )
    if work = Work.find_by( contact: contact, user: current_user )
       work.destroy
    else work = Work.new( contact: contact, user: current_user )
         work.save
    end

   redirect_to root_path
 end
end
