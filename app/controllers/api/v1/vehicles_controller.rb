module Api
  module V1
    class VehiclesController < ApplicationController

      # Lista de vehiculos
      def index
      vehicles =Vehicle.order('created_at DESC');
      render json:{status:'SUCCESS', message:'Carga de  vehiculos', data:vehicles},status: :ok
      end

      # Ver algún vehiculo en especifico
      def show
        vehicle = Vehicle.find(params[:id])
        render json: {status: 'SUCCESS', message:'Cargó vehiculo', data:vehicle},status: :ok
      end

      # Creación de Vehiculo
      def create
        # Creo otro objeto de Vehiculo con el fin de obtener la placa y saber que tipo de categoria es
        #y así poder crear un vehiculo con la categoría según la placa.
        vehicle1 = Vehicle.new
        categoriaN= vehicle1.category(params[:placa])
        añoN=params[:año]
        vehicle = Vehicle.new(:placa=>params[:placa],:color =>params[:color],:categoria=>categoriaN,:año=>añoN.to_i)
        puts(params[:placa])
        if vehicle.save
          render json: {status:'SUCCESS', message:'Vehiculo creado', data:vehicle},status: :ok
        else
          render json: {status:'ERROR', message: 'No pudo crearse el vehiculo', data:vehicle.errors},status: :unprocessable_entity
        end

      end
      # Eliminación de Vehiculo
      def destroy

        vehicle = Vehicle.find(params[:id])
        vehicle.destroy
        render json: {status:'SUCCESS', message:'Vehiculo eliminado', data:vehicle},status: :ok
      end
      # Modificación de vehiculo
      def update
        vehicle =Vehicle.find(params[:id])
        if vehicle.update_attributes(vehicle_params)
          render json: {status:'SUCCESS', message:'Vehiculo actualizado', data:vehicle},status: :ok
        else
          render json: {status:'SUCCESS', message:'Vehiculo no actualizado', data:vehicle},status: :unprocessable_entity
        end
      end
        private

      def vehicle_params

        params.permit(:placa, :color, :categoria , :año)
      end
    end
  end
  end
