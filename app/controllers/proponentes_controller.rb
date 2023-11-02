class ProponentesController < ApplicationController
    before_action :set_proponente, only: [:show, :edit, :update, :destroy]

  def index
    @proponentes = Proponente.all

    if params[:salario].present?
      salario = params[:salario].to_f
      @proponentes = @proponentes.where('salario >= ?', salario)
    end
  
    @proponentes = @proponentes.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @proponente = Proponente.new
  end

  def create
    @proponente = Proponente.new(proponente_params)
    if @proponente.save
      redirect_to @proponente
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @proponente.update(proponente_params)
      redirect_to @proponente
    else
      render 'edit'
    end
  end

  def destroy
    @proponente.destroy
    redirect_to proponentes_path
  end

  def calcular
    salario = params[:salario].to_f
    valor_calculado = salario / 1000
    render plain: valor_calculado.to_i.to_s
  end

  private

  def set_proponente
    @proponente = Proponente.find(params[:id])
  end

  def proponente_params
    params.require(:proponente).permit(:nome, :cpf, :data_nascimento, :logradouro, :bairro, :cidade, :estado, :cep, :telefone_pessoal, :telefone_referencia, :salario)
  end
end
