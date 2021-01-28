require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @food = FactoryBot.build(:food)
    @food.image = fixture_file_upload('app/assets/images/kuchibeni.png')
  end

  describe '商品出品機能' do
    it 'image, name, price, description, genre_id, drink_id, scene_id,allergy_id,day_idを入力すると、商品の出品ができる' do
      expect(@food).to be_valid
    end
    it 'imageが空だと登録できない' do
      @food.image = nil
      @food.valid?
      expect(@food.errors.full_messages).to include "Image can't be blank"
    end
    it 'nameが空だと登録できない' do
      @food.name = ''
      @food.valid?
      expect(@food.errors.full_messages).to include "Name can't be blank"
    end
    it 'descriptionが空だと登録できない' do
      @food.description = ''
      @food.valid?
      expect(@food.errors.full_messages).to include "Description can't be blank"
    end
    it 'category_idがないと登録できない' do
      @food.genre_id = 1
      @food.valid?
      expect(@food.errors.full_messages).to include 'Genre Select'
    end
    it 'drink_idがないと登録できない' do
      @food.drink_id = 1
      @food.valid?
      expect(@food.errors.full_messages).to include 'Drink Select'
    end
    it 'scene_idがないと登録できない' do
      @food.scene_id = 1
      @food.valid?
      expect(@food.errors.full_messages).to include 'Scene Select'
    end
    it 'allergy_idがないと登録できない' do
      @food.allergy_id = 1
      @food.valid?
      expect(@food.errors.full_messages).to include 'Allergy Select'
    end
    it 'day_idがないと登録できない' do
      @food.day_id = 1
      @food.valid?
      expect(@food.errors.full_messages).to include 'Day Select'
    end
    it 'priceが空だと登録できない' do
      @food.price = nil
      @food.valid?
      expect(@food.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceの範囲が¥1000~¥9,999,999の間でないと登録できない' do
      @food.price = 999
      @food.valid?
      expect(@food.errors.full_messages).to include 'Price Out of setting range'
    end
    it 'priceの範囲が¥1000~¥9,999,999の間でないと登録できない' do
      @food.price = 10_000_000
      @food.valid?
      expect(@food.errors.full_messages).to include 'Price Out of setting range'
    end
    it 'priceは半角数字でないと登録できない' do
      @food.price = '５００'
      @food.valid?
      expect(@food.errors.full_messages).to include 'Price Half-width number'
    end
    it 'priceは半角英数混合では登録できない' do
      @food.price = '1000yen'
      @food.valid?
      expect(@food.errors.full_messages).to include 'Price Half-width number'
    end
    it 'priceは全角文字では登録できない' do
      @food.price = '千円'
      @food.valid?
      expect(@food.errors.full_messages).to include 'Price Half-width number'
    end
    it '商品にuserが紐づかない場合は登録できない' do
      @food.user = nil
      @food.valid?
      expect(@food.errors.full_messages).to include 'User must exist'
    end
  end
end
