module Createhouseworks
  def Createhouseworks
    visit new_housework_path
    find(".form-control").set(10)
    #page.all('.form-control')[1].set(10)
    #page.all('.form-control')[3].set(10)
    #page.all('.form-control')[5].set(10)
    #page.all('.form-control')[7].set(10)
    #page.all('.form-control')[9].set(10)
    click_button 'ポイントを付与する'
  end
end
