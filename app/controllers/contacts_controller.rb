class ContactsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:index]

  def index
    if params[:term].present?
      @contacts = Contact.search(params[:term])
    else
      @contacts = Contact.all 
    end
  end

  def new
    @contact = current_user.contacts.build
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render 'edit'
    end
  end

  def show
    @contact = Contact.find(params[:id])
    if @contact.nil?
      render file: "#{Rails.root}/public/404.html" , status: :not_found  
    else
      @contact
    end 
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      redirect_to contacts_path
    end
  end

  def catch_404
    raise ActionController::RoutingError.new(params[:path]) 
  end

  def catch_422
    raise ActionController::UnknownFormat.new(params[:path]) 
  end

  private

    def contact_params
      params.require(:contact).permit(:last_name, :first_name, :address1, :address2, :city, :zip, :country, :telephone, :term)
    end
end
