class Proponente < ApplicationRecord
  validates :nome, :cpf, :data_nascimento, :logradouro, :bairro, :cidade, :estado, :cep, :telefone_pessoal, :salario, presence: true
  validates :cpf, format: { with: /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/, message: "deve estar no formato 999.999.999-99" }
  validates :cep, format: { with: /\A\d{5}-\d{3}\z/, message: "deve estar no formato 99999-999" }
end
