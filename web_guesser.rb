require 'sinatra'
require 'sinatra/reloader'

 x = Random.new
 number= x.rand(10..100)
 
SECRET_NUMBER = number

def check_guess(guess,number)
	if guess == nil or guess== ""
	   message =nil
	elsif guess.to_i > number
		if guess.to_i > number + 5
	    message ="Way too high!"
		else
		message =" too high!"
	    end
	elsif guess.to_i < number
        if guess.to_i < number - 5
        message ="Way too low!"
        else
        message ="Too low!"
        end
    elsif guess.to_i == number
        message = "You got it right!"      
	end
return message
end

get '/' do
	guess = params["guess"]
	message = check_guess(guess,SECRET_NUMBER)
	erb :index, :locals=>{:number=> number,:message => message}
end