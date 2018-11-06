require 'sinatra'
require 'sinatra/reloader'

 x = Random.new
 l= x.rand(10..100)

get '/' do
	"The SECRET NUMBER is #{l}" 
end