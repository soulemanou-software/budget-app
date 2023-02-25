require 'rails_helper'

RSpec.describe 'BudgetCategories#index', type: :feature do
  before(:each) do
    user = User.create!(name: 'William Raga', email: 'raga@gmail.com', password: 'asdfghjkl')
    login_as(user, scope: :user)
    @budget_category1 = BudgetCategory.create!(author: user, name: 'Transportation', icon: 'https://plus.unsplash.com/premium_photo-1661573515969-f60143837505?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80')
    @budget_category2 = BudgetCategory.create!(author: user, name: 'Insurance', icon: 'https://images.unsplash.com/photo-1612831457048-9823ce1ebb6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80')
    @budget_categories = BudgetCategory.all
    @user = User.first
    visit budget_categories_path
  end

  it 'displays all categories names' do
    @budget_categories.each do |category|
      expect(page).to have_content(category.name)
    end
  end

  it 'displays all categories totals' do
    @budget_categories.each do |category|
      expect(page).to have_content(category.total)
    end
  end

  it 'displays current user name' do
    expect(page).to have_content(@user.name)
  end

  it 'Log\'s current user out' do
    click_button 'Log out'
    expect(current_path).to match root_path
  end

  it 'Redirects to add new category page' do
    click_link 'Add New category'
    expect(current_path).to match new_budget_category_path
  end
end
