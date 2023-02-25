class ApplicationController < Sinatra::Base
set :default_content_type, 'application/json'
  # add routes

  get '/bakeries' do
      bakery = Bakery.all
      bakery.to_json
  end

  get '/bakeries/:id' do
    # return a single bakery
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    #returns an array of baked goods as JSON, sorted by price in descending order

    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.order(price: :desc).first
    baked_goods.to_json
  end

end
