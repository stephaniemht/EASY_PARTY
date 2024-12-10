class JackpotsController < ApplicationController

  def show
    @jackpot = Jackpot.find(params[:id])
    if @jackpot.event.any?
      puts "#{@jackpot.total}"
    else
      puts "This event aren't jackpot"
    end
  end

  def new
    @jackpot = Jackpot.new
  end

  def create
    
  end
end
