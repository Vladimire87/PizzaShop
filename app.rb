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
 @orders = Order.all
end

get '/' do
	erb :index
end

get "/about" do
	erb :about
end

get "/admin" do
	erb :admin
end

get '/pizza/:title' do
 title =  params[:title]
 @pizza = Product.find_by(title:[params[:title]])
 erb :pizza
end

post '/cart' do
	order = Order.new
	orders_input = params[:orders]
	@orders = parse_orders_line orders_input
	@orders.each do |i|
		i[0] = @products.find(i[0])
	end

  erb :cart
end

post '/order' do
	@order = Order.new params[:order]

	if @order.save
		erb "Thank you! You Order: #{@order.id}, for: #{@order.name} done."
	else
		@error = @order.errors.full_messages.first
    erb :index
	end

end

def parse_orders_line orders_input
  s1 = orders_input.split(/,/)
  arr = []
  s1.each do |x|
    s2 = x.split(/=/)
    s3 = s2[0].split(/_/)
  
    id = s3[1]
    cnt = s2[1]
    arr2 = [id, cnt]
    arr.push arr2
  end
  return arr
end