# spec/models/client_spec.rb

require 'rails_helper'

RSpec.describe Cliente, type: :model do
  describe '#name' do
    it 'should be present' do
      client = Cliente.new
      expect(client).not_to be_valid
      expect(client.errors[:name]).to include("can't be blank")
    end
  end

  describe '#endereco' do
    it 'should be present' do
      client = Cliente.new
      expect(client).not_to be_valid
      expect(client.errors[:endereco]).to include("can't be blank")
    end
  end

  describe '#save' do
    it 'should save a valid client' do
      client = Cliente.new(name: 'John', endereco: 'Rua dos Bobos, 0')
      expect(client.save).to be true
    end
  end
end

