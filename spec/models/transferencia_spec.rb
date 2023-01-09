# spec/models/Transferencia_spec.rb

require 'rails_helper'

RSpec.describe Transferencia, type: :model do
  describe '#conta_origem' do
    it 'should be present' do
      Transferencia = Transferencia.new
      expect(Transferencia).not_to be_valid
      expect(Transferencia.errors[:conta_origem]).to include("can't be blank")
    end
  end

  describe '#conta_destino' do
    it 'should be present' do
      Transferencia = Transferencia.new
      expect(Transferencia).not_to be_valid
      expect(Transferencia.errors[:conta_destino]).to include("can't be blank")
    end
  end

  describe '#valor' do
    it 'should be present' do
      Transferencia = Transferencia.new
      expect(Transferencia).not_to be_valid
      expect(Transferencia.errors[:valor]).to include("can't be blank")
    end

    it 'should be a number' do
      Transferencia = Transferencia.new(valor: 'abc')
      expect(Transferencia).not_to be_valid
      expect(Transferencia.errors[:valor]).to include('is not a number')
    end

    it 'should be greater than 0' do
      Transferencia = Transferencia.new(valor: 0)
      expect(Transferencia).not_to be_valid
      expect(Transferencia.errors[:valor]).to include('must be greater than 0')
    end
  end

  describe '#save' do
    it 'should save a valid Transferencia' do
      client1 = Client.create!(name: 'John', endereco: 'Rua dos Bobos, 0')
      client2 = Client.create!(name: 'Jane', endereco: 'Rua dos Bobos, 1')
      account1 = Account.create!(number: '123456', saldo: 1000, cliente_id: client1.id)
      account2 = Account.create!(number: '654321', saldo: 500, cliente_id: client2.id)
      Transferencia = Transferencia.new(conta_origem: account1, conta_destino: account2, valor: 100)
      expect(Transferencia.save).to be true
    end
  end
end
