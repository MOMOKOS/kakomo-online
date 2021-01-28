class Allergy < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '卵' },
    { id: 3, name: '乳' },
    { id: 4, name: '小麦' },
    { id: 5, name: 'そば' },
    { id: 6, name: '落花生' },
    { id: 7, name: 'えび' },
    { id: 8, name: 'かに' },
    { id: 9, name: 'その他 ※購入時の備考欄でご指定ください' },
    { id: 10, name: 'なし' }

  ]

  include ActiveHash::Associations
  has_many :foods
end
