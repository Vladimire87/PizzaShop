#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: 'sqlite3', database: 'pizza.db'}

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
	validates :products, :name, :phone, :address, presence: true
end

before do
	@products = Product.all
end

get '/' do
	erb :index
end

get '/about' do
	erb :about
end

get '/admin' do
	@orders = Order.all.order("created_at DESC")
	erb :admin
end

get '/pizza/:title' do
	@pizza = Product.find_by(title: params[:title])
	erb :pizza
end

post '/cart' do
	@orders = parse_orders_line(params[:orders])
	if @orders.empty?
		return erb "Cart is Empty"
	end

	@orders.each do |order|
		order[0] = @products.find(order[0])
	end

	erb :cart
end

post '/order' do
	@order = Order.new(params[:order])

	if @order.save
		erb :order_placed
	else
		@error = @order.errors.full_messages.first
		erb :index
	end
end

def parse_orders_line(orders_input)
	arr = []
	orders_input.split(/,/).each do |order_input|
		id, cnt = order_input.split(/=/)[0].split(/_/)[1], order_input.split(/=/)[1]
		arr.push [id, cnt]
	end
	arr
end
