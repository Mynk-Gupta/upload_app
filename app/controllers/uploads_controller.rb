class UploadsController < ApplicationController
  before_action :set_upload, only: [:destroy, :share]

  def new
    @upload = Upload.new
  end

  def create
    @upload = current_user.uploads.new(upload_params)
    if @upload.save
      flash[:success] = "File uploaded successfully."
      redirect_to authenticated_root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @upload.destroy
    flash[:success] = "File removed successfully."
    redirect_to authenticated_root_path
  end

  def generate
    @upload.generate_tiny_url
    flash[:success] = "Tiny Url generated successfully."
    redirect_to authenticated_root_path
  end

  private
  def set_upload
    @upload = Upload.find(params[:id])
  end

  def upload_params
    params.require(:upload).permit(:title, :description, :file)
  end
end

