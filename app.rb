#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'pizza.db'}

class Product < ActiveRecord::Base
end

before do
 @products = Product.all
end

get '/' do
	erb :index
end

get "/about" do
	erb :about
end

get '/pizza/:title' do
 title =  params[:title]
 @pizza = Product.find_by(title:[params[:title]])
 erb :pizza
end

post '/cart' do
  erb :cart
end