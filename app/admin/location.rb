ActiveAdmin.register Location do
  controller do
    def permitted_params
      params.permit location: [:name, :address, :latitude, :longitude]
    end
  end
end
