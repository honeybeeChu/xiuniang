class PointsRulesController < ApplicationController
  skip_before_filter :verify_authenticity_token,:only => :modify
  layout 'manager'

  def index
    @pointsrules = PointsRule.all
  end



  def modify
    puts '-----------++++++++++++++++++++++++++++++++++++++++++--'
    puts params[:condition]
    puts '-------------'
    points_rule =  PointsRule.find(params[:id])
    # points_rule[:name] = params[:name]
    # points_rule[:rate] = params[:rate]
    # points_rule[:consumption] = params[:consumption]
    # points_rule[:condition] = params[:condition]
    # points_rule[:trade_num] = params[:trade_num]
    #
    # points_rule.update_attribute(:rate, params[:rate])

     points_rule.update_attributes(:name => params[:name],:rate => params[:rate],:trade_num => params[:trade_num],:condition => params[:condition],:consumption =>  params[:consumption])


    respond_to do |format|
      format.json { render json: {'flag'=>'ok'} }
    end


  end




  private
  def pointsrule_params
    params.require(:pointsrule).permit(:name,:level, :rate, :consumption,:condition, :trade_num)
  end
end
