*** Settings ***

Library    SeleniumLibrary
Library    FakerLibrary
Library    BuiltIn



Variables    ../Fixture/url.yaml
Variables    ../Fixture/page_elements.yaml


# KEYWORDS
Resource    ../utils/keywords/serverest_keywords.resource