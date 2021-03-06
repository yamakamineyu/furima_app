class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # アソシエーション
  has_many               :comments,    dependent: :destroy
  has_many               :item_images, dependent: :destroy
  belongs_to             :user
  belongs_to             :buyer,       optional: true
  belongs_to             :category
  belongs_to_active_hash :prefecture
  has_many :buyers #中間テーブル
  has_many :users, through: :buyers
  
  # バリデーション
  validates :name,          presence: true
  validates :description,   presence: true
  validates :category,      presence: true
  validates :condition,     presence: true
  validates :shipping_cost, presence: true
  validates :prefecture,    presence: true
  validates :shipping_day,  presence: true
  validates :item_images,   presence: true
  validates :price,         presence: true ,numericality: { only_integer: true,greater_than: 300, less_than: 9999999}

  # 出品機能で記述
  accepts_nested_attributes_for :item_images, allow_destroy: true
end
