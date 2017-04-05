class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    Plan.delete_all

    file = params[:plan][:file].path.to_s
    xlsx = Roo::Excelx.new(file)

    xlsx.each_row_streaming do |row|
      category, main_group_name, project_number, project_name, accuracy, dept_name, group_name, sub_number, system_name, contract_type, company_name, member_rank, unit_price, manhour_last_month_landing, manhour_performance, manhour_development_plan, manhour_landing, manhour_divergence, manhour_ernings, money_last_month_landing, money_performance, money_development_plan, money_landing, money_divergence, money_ernings, cost_rate_plan, cost_rate_landing, gross_profit_plan, gross_profit_landing, gross_profit_divergence, to_be_confirmed, m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12 = row.map(&:value)
  
      next if contract_type =~ /合計/
      next if contract_type =~ /契約形態/
      next if contract_type.nil?

      Plan.create(category: category, main_group_name: main_group_name, project_number: project_number, project_name: project_name, accuracy: accuracy, dept_name: dept_name, group_name: group_name, sub_number: sub_number, system_name: system_name, contract_type: contract_type, company_name: company_name, member_rank: member_rank, unit_price: unit_price, manhour_last_month_landing: manhour_last_month_landing, manhour_performance: manhour_performance, manhour_development_plan: manhour_development_plan, manhour_landing: manhour_landing, manhour_divergence: manhour_divergence, manhour_ernings: manhour_ernings, money_last_month_landing: money_last_month_landing, money_performance: money_performance, money_development_plan: money_development_plan, money_landing: money_landing, money_divergence: money_divergence, money_ernings: money_ernings, cost_rate_plan: cost_rate_plan, cost_rate_landing: cost_rate_landing, gross_profit_plan: gross_profit_plan, gross_profit_landing: gross_profit_landing, gross_profit_divergence: gross_profit_divergence, to_be_confirmed: to_be_confirmed, m1: m1, m2: m2, m3: m3, m4: m4, m5: m5, m6: m6, m7: m7, m8: m8, m9: m9, m10: m10, m11: m11, m12: m12)
    end
    render :new
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:category, :group_name, :project_number, :project_name, :accuracy, :dept_name, :group_name, :sub_number, :system_name, :contract_type, :company_name, :member_rank, :unit_price, :manhour_last_month_landing, :manhour_performance, :manhour_development_plan, :manhour_landing, :manhour_divergence, :manhour_ernings, :money_last_month_landing, :money_performance, :money_development_plan, :money_landing, :money_divergence, :money_ernings, :cost_rate_plan, :cost_rate_landing, :gross_profit_plan, :gross_profit_landing, :gross_profit_divergence, :to_be_confirmed, :m1, :m2, :m3, :m4, :m5, :m6, :m7, :m8, :m9, :m10, :m11, :m12)
    end
end
