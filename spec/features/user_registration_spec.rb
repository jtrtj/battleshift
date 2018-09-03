require 'rails_helper'

describe "An Unregistered User" do
  context "Visiting root path" do
    it "can click register to create an acount and be sent an email to activate account" do
      visit '/'

      click_link 'Register'
     
      expect(current_path).to eq('/register')
      
      attributes = {
                    email:    'fake@123.com',
                    name:     'Captain',
                    password: 'password'
                   }

      fill_in 'user[email]',	with: attributes[:email]
      fill_in 'user[name]',	with: attributes[:name]
      fill_in 'user[password]',	with: attributes[:password]
      fill_in 'user[password_confirmation]',	with: attributes[:password]

      click_button 'Submit'
                   
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as #{attributes[:name]}")             
      expect(page).to have_content("This account has not yet been activated. Please check your email.")
    end
 
    it "cannot register if password fields do not match" do
      visit '/register'
      
      attributes = {
                    email:    'fake@123.com',
                    name:     'Captain',
                    password: 'password',
                    unmatched_password: 'assword'
                   }

      fill_in 'user[email]',	with: attributes[:email]
      fill_in 'user[name]',	with: attributes[:name]
      fill_in 'user[password]',	with: attributes[:password]
      fill_in 'user[password_confirmation]',	with: attributes[:unmatched_password]

      click_button 'Submit'
                
      expect(current_path).to eq('/register')
      expect(page).to have_content("Something went wrong")
    end

    it 'cannot register with and email that is all ready registered.' do
      create(:user, email: "used@gmail.com") 

      visit '/register'
      
      attributes = {
                    email:    'used@gmail.com',
                    name:     'Captain',
                    password: 'password',
                    unmatched_password: 'password'
                   }

      fill_in 'user[email]',	with: attributes[:email]
      fill_in 'user[name]',	with: attributes[:name]
      fill_in 'user[password]',	with: attributes[:password]
      fill_in 'user[password_confirmation]',	with: attributes[:unmatched_password]

      click_button 'Submit'
                
      expect(current_path).to eq('/register')
      expect(page).to have_content("Something went wrong")
    end
  end
end