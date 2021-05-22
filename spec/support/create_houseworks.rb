module Createhouseworks
  def create_houseworks(group)
    visit new_group_housework_path(group.id)
    page.all('.form-control')[1].set(10)
    page.all('.form-control')[3].set(10)
    page.all('.form-control')[5].set(10)
    page.all('.form-control')[7].set(10)
    page.all('.form-control')[9].set(10)
    click_button 'ポイントを付与する'
    visit group_houseworks_path(group.id)
  end
end
