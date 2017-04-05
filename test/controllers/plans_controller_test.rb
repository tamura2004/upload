require 'test_helper'

class PlansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plan = plans(:one)
  end

  test "should get index" do
    get plans_url
    assert_response :success
  end

  test "should get new" do
    get new_plan_url
    assert_response :success
  end

  test "should create plan" do
    assert_difference('Plan.count') do
      post plans_url, params: { plan: { accuracy: @plan.accuracy, category: @plan.category, company_name: @plan.company_name, contract_type: @plan.contract_type, cost_rate_landing: @plan.cost_rate_landing, cost_rate_plan: @plan.cost_rate_plan, dept_name: @plan.dept_name, gross_profit_divergence: @plan.gross_profit_divergence, gross_profit_landing: @plan.gross_profit_landing, gross_profit_plan: @plan.gross_profit_plan, group_name: @plan.group_name, group_name: @plan.group_name, m10: @plan.m10, m11: @plan.m11, m12: @plan.m12, m1: @plan.m1, m2: @plan.m2, m3: @plan.m3, m4: @plan.m4, m5: @plan.m5, m6: @plan.m6, m7: @plan.m7, m8: @plan.m8, m9: @plan.m9, manhour_development_plan: @plan.manhour_development_plan, manhour_divergence: @plan.manhour_divergence, manhour_ernings: @plan.manhour_ernings, manhour_landing: @plan.manhour_landing, manhour_last_month_landing: @plan.manhour_last_month_landing, manhour_performance: @plan.manhour_performance, member_rank: @plan.member_rank, money_development_plan: @plan.money_development_plan, money_divergence: @plan.money_divergence, money_ernings: @plan.money_ernings, money_landing: @plan.money_landing, money_last_month_landing: @plan.money_last_month_landing, money_performance: @plan.money_performance, project_name: @plan.project_name, project_number: @plan.project_number, sub_number: @plan.sub_number, system_name: @plan.system_name, to_be_confirmed: @plan.to_be_confirmed, unit_price: @plan.unit_price } }
    end

    assert_redirected_to plan_url(Plan.last)
  end

  test "should show plan" do
    get plan_url(@plan)
    assert_response :success
  end

  test "should get edit" do
    get edit_plan_url(@plan)
    assert_response :success
  end

  test "should update plan" do
    patch plan_url(@plan), params: { plan: { accuracy: @plan.accuracy, category: @plan.category, company_name: @plan.company_name, contract_type: @plan.contract_type, cost_rate_landing: @plan.cost_rate_landing, cost_rate_plan: @plan.cost_rate_plan, dept_name: @plan.dept_name, gross_profit_divergence: @plan.gross_profit_divergence, gross_profit_landing: @plan.gross_profit_landing, gross_profit_plan: @plan.gross_profit_plan, group_name: @plan.group_name, group_name: @plan.group_name, m10: @plan.m10, m11: @plan.m11, m12: @plan.m12, m1: @plan.m1, m2: @plan.m2, m3: @plan.m3, m4: @plan.m4, m5: @plan.m5, m6: @plan.m6, m7: @plan.m7, m8: @plan.m8, m9: @plan.m9, manhour_development_plan: @plan.manhour_development_plan, manhour_divergence: @plan.manhour_divergence, manhour_ernings: @plan.manhour_ernings, manhour_landing: @plan.manhour_landing, manhour_last_month_landing: @plan.manhour_last_month_landing, manhour_performance: @plan.manhour_performance, member_rank: @plan.member_rank, money_development_plan: @plan.money_development_plan, money_divergence: @plan.money_divergence, money_ernings: @plan.money_ernings, money_landing: @plan.money_landing, money_last_month_landing: @plan.money_last_month_landing, money_performance: @plan.money_performance, project_name: @plan.project_name, project_number: @plan.project_number, sub_number: @plan.sub_number, system_name: @plan.system_name, to_be_confirmed: @plan.to_be_confirmed, unit_price: @plan.unit_price } }
    assert_redirected_to plan_url(@plan)
  end

  test "should destroy plan" do
    assert_difference('Plan.count', -1) do
      delete plan_url(@plan)
    end

    assert_redirected_to plans_url
  end
end
