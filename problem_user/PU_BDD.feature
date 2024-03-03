# Project Name: Sauce Labs
# Designed By: David Vilas Boas
# Test Environment:
#   Browser: Chrome Version 120.0.6099.225 (Official Build) (64-bit).
#   Operating System: Windows 10 Pro Education, version 22H2.
#   Website Version: OrangeHRM OS 5.5.
# Delivery Date: 1/22/2024

Feature: Login

    Scenario: Login Happy Path
        Given I'm on the website "https://www.saucedemo.com/"
        And the internet connection is on
        When I insert a valid username "problem_user" in the "Username" field
        And insert a valid password "secret_sauce" in the "Password" field
        And click on the "Login" button
        Then I get logged in successfully
        And navigated until the "https://www.saucedemo.com/inventory.html" page

    Scenario: Case sensitivity in the "Username" field
        Given I'm on the website "https://www.saucedemo.com/"
        And the internet connection is on
        When insert a valid username with wrong letter's case "Problem_user" in the "Username" field
        And Insert a valid password "secret_sauce" in the "Password" field
        And click on the "Login" button
        Then the login fails
        And an error message appears "Epic sadface: Username and password do not match any user in this service"

    Scenario: Case sensitivity in the "Password" field
        Given I'm on the website "https://www.saucedemo.com/"
        And the internet connection is on
        When insert a valid username "problem_user" in the "Username" field
        And Insert a valid password with wrong letter's case "Secret_sauce" in the "Password" field
        And click on the "Login" button
        Then the login fails
        And an error message appears "Epic sadface: Username and password do not match any user in this service"

    Scenario: Switch "Password" and "Username" fill-in fields
        Given I'm on the website "https://www.saucedemo.com/"
        And the internet connection is on
        When I insert a valid password "secret_sauce" in the "Username" field
        And insert a valid username "problem_user" in the "Password" field
        And click on the "Login" button
        Then the login fails
        And an error message appears "Epic sadface: Username and password do not match any user in this service"

Feature: Add to Cart

    Scenario: Add to cart successfully
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When choose an item and click on the "Add to cart" button
        And click on the cart icon in the upper right corner
        And check if the selected item and cart's one match
        Then the chosen item get clicked, the cart icon recieves 1 number (more) on itself
        And both the cart's and selected items match

    Scenario: Remove cart item
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the "remove" button
        And click on cart icon
        Then the cart decreases 1 number on its icon
        And the removed item is in the cart

    Scenario: Select an item after open its page
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the item's name or image
        And click on "Add to cart" button
        Then the chosen item get clicked, the cart icon recieves 1 number (more) on itself
        And both the cart's and selected items don't match

    Scenario: "/inventory.html" prices' page match cart's prices' page
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When choose an item and click on the "Add to cart" button
        And check if the price is the same
        Then both the cart's and selected items' prices match

    Scenario: Item's prices' page match cart's prices' page
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the "Add to cart" button of a chosen item
        And click on "Add to cart" button
        And click on the cart icon button
        And check if the price is the same
        Then both the cart's and selected items' prices match

    Scenario: Item's picture matches relatively to the item's description
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When see if the item's image matchs with the item's description
        Then both the item's image and description aren't related

Feature: Filter

    Scenario: A-Z
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the filter menu
        And select A-Z option
        Then items' names are given alphabetcally

    Scenario: Z-A
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the filter menu
        And select Z-A option
        Then items' names aren't displayed in inverted alphabectical order

    Scenario: Low-high price
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the filter menu
        And select low-high price option
        Then items' prices aren't arranged from low to high

    Scenario: High-low price
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the filter menu
        And select high-low price option
        Then items' prices aren't arranged from high to low

Feature: Checkout

    Scenario: Checkout button
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When after select item, go to cart "/cart.html"
        And click on "Checkout" button in the lower right corner
        Then button navigates to "/checkout-step-one.html"

    Scenario: Fist Checkout page Happy path
        Given I'm on the website "https://www.saucedemo.com/checkout-step-one.html"
        And the internet connection is on
        When fill in the three fields with valid first name "David"
        And a valid last name "Vilas Boas"
        And a zip/postal code "4700-028"
        And click on "Continue" button in the lower right corner
        Then "Continue" button doesn't navigate to "/checkout-step-two.html" with the "Checkout: Overview"

    Scenario: Blank filled-in fields
        Given I'm on the website "https://www.saucedemo.com/checkout-step-one.html"
        And the internet connection is on
        When I do not fill in any field
        And click on "Continue" button in the lower right corner
        Then checkout fails
        And an error message appears "Error: First Name is required"

Feature: Navigation Menu

    Scenario: All Items
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the three lines "Navegation Menu" upper left corner
        And click on "All Items"
        Then when clicked, it brings me until "/inventory.html" page

    Scenario: About
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the three lines 'Navegation Menu' upper left corner
        And click on "About"
        Then when clicked, it doesn't bring me until "https://saucelabs.com/" page

    Scenario: Logout
        Given I'm on the website "https://www.saucedemo.com/inventory.html"
        And the internet connection is on
        When click on the three lines "Navegation Menu" upper left corner
        And click on "Logout"
        Then when clicked, I log out
        And it brings me until "https://www.saucedemo.com/" page

    Scenario: Reset App State
        Given click on the three lines "Navegation Menu" upper left corner
        And the internet connection is on
        When click on "Reset App State"
        And when clicked, it resets my modifier actions
        Then select high-low price option
        And cart's item(s) gets out of the cart