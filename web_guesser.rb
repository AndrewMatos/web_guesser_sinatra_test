require 'sinatra'
require 'sinatra/reloader'

 x = Random.new
 number= x.rand(10..100)

get '/' do
	erb :index, :locals=>{:number=> number}
end