require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
	
    guess = params["guess"]
	message = check_guess(guess,SECRET_NUMBER)
    
    if @@turns == 0 && message !="You got it right!"
    number = x.rand(10..100)
    SECRET_NUMBER = number
    @@turns=5	
    end

    if message !="You got it right!"
	  @@turns-=1
    end

	if guess == "restart"
	 number = x.rand(10..100)
	 SECRET_NUMBER = number
	 @@turns=5
   end
	
    
    cheat = params["cheat"]

    erb :index, :locals=>{:number=> number,:message => message,:turns => @@turns,:cheat=>cheat}
end

 x = Random.new
 number= x.rand(10..100)
 
SECRET_NUMBER = number

def check_guess(guess,number)
	if guess == nil or guess== "" or guess == "restart"
	   message =nil
	elsif guess.to_i > number
		if guess.to_i > number + 5
	    message ="Way too high!"
		else
		message ="Too high!"
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

@@turns=6

