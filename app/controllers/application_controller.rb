# class ApplicationController < Sinatra::Base

#   # add routes

#   get '/bakeries' do
#     set :default_content_type, 'application/json'
#     bakeries = Bakery.all

#     bakeries.to_json
#   end 

#   get '/bakeries/:id' do
#     set :default_content_type, 'application/json'
#     bakery = Bakery.find(params[:id])
#     bakery.to_json(include: { :baked_goods })
#   end 

#   get '/baked_goods/by_price' do
#     baked_good = BakedGood.all.order(:price)
#   end 

#   get 'baked_goods/most_expensive' do
#     baked_good = BakedGood.all.max(:price).limit(1)
#   end 

# end

class ApplicationController < Sinatra::Base
  set default_content_type: "application/json"
  
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end
  
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    # see the BakedGood class for the  method definition of `.by_price`
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    # see the BakedGood class for the  method definition of `.by_price`
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end

end