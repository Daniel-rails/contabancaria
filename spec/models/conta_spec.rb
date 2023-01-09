# spec/models/account_spec.rb

require 'rails_helper'

RSpec.describe Account, type: :model do
  describe '#number' do
    it 'should be present' do
      account = Account.new
      expect(account).not_to be_valid
      expect(account.errors[:number]).to include("can't be blank")
    end
  end

  describe '#saldo' do
    it 'should be present' do
      account = Account.new
      expect(account).not_to be_valid
      expect(account.errors[:saldo]).to include("can't be blank")
    end

    it 'should be a number' do
      account = Account.new(saldo: 'abc')
      expect(account).not_to be_valid
      expect(account.errors[:saldo]).to include('is not a number')
    end
  end

  describe '#cliente_id' do
    it 'should be present' do
      account = Account.new
      expect(account).not_to be_valid
      expect(account.errors[:cliente_id]).to include("can't be blank")
    end
  end

  describe '#save' do
    it 'should save a valid account' do
      client = Client.create!(name: 'John', endereco: 'Rua dos Bobos, 0')
      account = Account.new(number: '123456', saldo: 1000, cliente_id: client.id)
      expect(account.save).to be true
    end
  end
end
