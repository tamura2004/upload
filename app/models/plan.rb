class Plan < ApplicationRecord
  validates :category, uniqueness: { scope: [:main_group_name, :project_number, :project_name, :accuracy, :dept_name, :group_name, :sub_number, :system_name, :contract_type, :company_name, :member_rank]}
end
