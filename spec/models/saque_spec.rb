# spec/models/saque_spec.rb

require 'rails_helper'

RSpec.describe Saque, type: :model do
  describe '#saque' do
    it 'should be present' do
      saque = Saque.new
      expect(saque).not_to be_valid
      expect(saque.errors[:saque]).to include("can't be blank")
    end
  end

  describe '#valor' do
    it 'should be present' do
      saque = Saque.new
      expect(saque).not_to be_valid
      expect(saque.errors[:valor]).to include("can't be blank")
    end

    it 'should be a number' do
      saque = Saque.new(valor: 'abc')
      expect(saque).not_to be_valid
      expect(saque.errors[:valor]).to include('is not a number')
    end

    it 'should be greater than 0' do
      saque = Saque.new(valor: 0)
      expect(saque).not_to be_valid
      expect(saque.errors[:valor]).to include('must be greater than 0')
    end
  end

  describe '#save' do
    it 'should save a valid saque' do
      client = Client.create!(name: 'John', endereco: 'Rua dos Bobos, 0')
      account = Account.create!(number: '123456', saldo: 1000, cliente_id: client.id)
      saque = Saque.new(saque: account, valor: 100)
      expect(saque.save).to be true
    end
  end
end
