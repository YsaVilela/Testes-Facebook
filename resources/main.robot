*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR
Library    AutoItLibrary
Library    OperatingSystem

### Shared ###
Resource    shared/setup.robot

### Pages ###
Resource    pages/login_page.robot
Resource    pages/feed_page.robot