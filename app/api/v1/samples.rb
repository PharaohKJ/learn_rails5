# coding: utf-8
module V1
  class Samples < Grape::API
    resource :samples do
      desc 'Return samples.'
      get do
        Sample.limit(20)
      end

      route_param :id do
        desc 'Return a active sample'
        get do
          Sample.find_by(id: params[:id])
        end
      end

      desc 'Create a Sample'
      params do
        requires :name, type: String, desc: 'name'
      end
      post do
        Sample.create(name: params[:name])
      end

      desc 'delete'
      params do
        requires :id, type: Integer, desc: 'Sample id'
      end
      delete ':id' do
        Sample.find(params[:id]).destroy
      end
    end
  end
end
