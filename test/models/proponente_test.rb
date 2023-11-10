require 'test_helper'

class ProponenteTest < ActiveSupport::TestCase
  test 'validates presence of required fields' do
    proponente = Proponente.new
    assert_not proponente.valid?
    assert_equal [
      "Nome não pode ficar em branco",
      "Cpf não pode ficar em branco",
      "Data nascimento não pode ficar em branco",
      "Logradouro não pode ficar em branco",
      "Bairro não pode ficar em branco",
      "Cidade não pode ficar em branco",
      "Estado não pode ficar em branco",
      "Cep não pode ficar em branco",
      "Telefone pessoal não pode ficar em branco",
      "Salario não pode ficar em branco"
    ], proponente.errors.full_messages
  end

  test 'validates format of CPF' do
    proponente = Proponente.new(cpf: '123.456.789-01')
    assert_not proponente.valid?
    assert_equal ["Cpf deve estar no formato 999.999.999-99"], proponente.errors.full_messages
  end

  test 'validates format of CEP' do
    proponente = Proponente.new(cep: '12345-6789')
    assert_not proponente.valid?
    assert_equal ["Cep deve estar no formato 99999-999"], proponente.errors.full_messages
  end


end
