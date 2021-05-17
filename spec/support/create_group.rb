module Creategroup
  def creategroup
    visit new_group_path
    fill_in 'グループ名', with: 'サンプルグループ'
    click_button '作成'
  end
end
