# app/controllers/charts_controller.rb

class ChartsController < ApplicationController
    def bar_chart_data
      # Lógica para recuperar os dados do gráfico
      data = [12, 19, 3, 5, 2, 3]
      render json: data
    end
  end
  