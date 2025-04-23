class CalcController < ApplicationController

  def square_form
    render ({:template => "form_templates/square"})
  end 

  def square_root_form
    render ({:template => "form_templates/square_root"})
  end 

  def payment_form
    render ({:template => "form_templates/payment"})
  end

  def random_form
    render ({:template => "form_templates/random"})
  end

  def square_results
    
    @the_num = params.fetch("number").to_f
    @the_result = @the_num**2
    
    render ({:template => "results_templates/square"})
  end 

  def square_root_results
    
    @the_num = params.fetch("user_number").to_f
    @the_result = @the_num ** 0.5
    
    render ({:template => "results_templates/square_root"})
  end

  def payment_results
    
    @APR = params.fetch("APR").to_f
    @monthly_APR = (@APR/100/12)
    @years = params.fetch("years").to_f
    @months = @years * 12
    @prin = params.fetch("principal").to_f

    @pmt = (@monthly_APR*@prin) / (1-((1+@monthly_APR)**-@months))
    
    render ({:template => "results_templates/payment"})
  end

  def random_results
    
    @min = params.fetch("min").to_f
    @max = params.fetch("max").to_f
    @random_num = rand(@min...@max)
    
    render ({:template => "results_templates/random"})
  end


end
