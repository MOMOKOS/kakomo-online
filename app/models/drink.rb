class Drink < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ビール' },
    { id: 3, name: 'ワイン' },
    { id: 4, name: '日本酒' },
    { id: 5, name: '焼酎' },
    { id: 6, name: 'ウイスキー' },
    { id: 7, name: 'カクテル' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :foods
end
