class PlansController < ApplicationController

  def index
    @plans = Plan.find_by_sql <<-SQL
      select
        project_number,
        project_name,
        sum(m1) as t1,
        sum(m2) as t2,
        sum(m3) as t3,
        sum(m4) as t4,
        sum(m5) as t5,
        sum(m6) as t6,
        sum(m7) as t7,
        sum(m8) as t8,
        sum(m9) as t9,
        sum(m10) as t10,
        sum(m11) as t11,
        sum(m12) as t12
      from
        plans
      group by
        project_number,
        project_name
      order by
        t1 desc
    SQL
  end

  def new
    @plan = Plan.new
  end

  PRIME_KEYS = %i(category main_group_name project_number project_name accuracy dept_name group_name sub_number system_name contract_type company_name member_rank)
  
  OTHER_KEYS = %i(unit_price manhour_last_month_landing manhour_performance manhour_development_plan manhour_landing manhour_divergence manhour_ernings money_last_month_landing money_performance money_development_plan money_landing money_divergence money_ernings cost_rate_plan cost_rate_landing gross_profit_plan gross_profit_landing gross_profit_divergence to_be_confirmed m1 m2 m3 m4 m5 m6 m7 m8 m9 m10 m11 m12)

  ALL_KEYS = PRIME_KEYS + OTHER_KEYS

  def create
    file = params[:plan][:file].path.to_s
    xlsx = Roo::Excelx.new(file)

    xlsx.each_row_streaming do |row|
      @attr = Hash[ALL_KEYS.zip(row.map(&:value))]
      @key = @attr.reject{|k,v| !PRIME_KEYS.include?(k) }
  
      next if @attr[:contract_type] =~ /合計/
      next if @attr[:contract_type] =~ /契約形態/
      next if @attr[:contract_type].nil?

      if @plan = Plan.find_by(@key)
        @plan.update(@attr)
      else
        Plan.create(@attr)
      end
    end
    @plan = Plan.new
    render :new
  end

end
