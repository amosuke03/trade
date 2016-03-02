require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require "sinatra/json"
require 'mechanize'
require 'sinatra/base'
require 'open-uri'
# require 'nokogiri'
require './scraping'
require 'sqlite3'
require 'active_record'
require 'json'

require './models/brand.rb'

set :server, %w[thin puma reel webrick]

get '/' do
    @brands = Brand.all
    @categories = Category.all
    erb :index
end

post '/create' do
    Brand.create({
        brand_name: params[:brand_name],
        code: params[:code],
        price2: params[:price2],
        category_id: params[:category]
    })
redirect '/'
end

post '/delete/:id' do
    Brand.find(params[:id]).destroy
    redirect '/'
end

get '/category/:id' do
    @categories    =Category.all
    @category      =Category.find(params[:id])
    @category_name =@category.name
    @brands        =@category.brands
    erb :index
end

get '/update' do
    puts "move"
    @brand=Brand.all
    puts "call scrayping"
    Scraping.get_price1(@brand)
    puts "call back scrayping"
    # redirect '/'
end

get '/update/last' do
    brand = Brand.all
    brand.to_json
#   {price3: brand.price3, price4: brand.price4}.to_json
end

