require "application_system_test_case"

class SurveysTest < ApplicationSystemTestCase
  setup do
    @survey = surveys(:one)
  end

  test "visiting the index" do
    visit surveys_url
    assert_selector "h1", text: "Surveys"
  end

  test "creating a Survey" do
    visit surveys_url
    click_on "New Survey"

    fill_in "Body ache", with: @survey.body_ache
    fill_in "Comment", with: @survey.comment
    fill_in "Cough", with: @survey.cough
    fill_in "Diarrhea", with: @survey.diarrhea
    fill_in "Difficulty breathing", with: @survey.difficulty_breathing
    fill_in "Fatigue", with: @survey.fatigue
    fill_in "Fever chills", with: @survey.fever_chills
    fill_in "Headache", with: @survey.headache
    fill_in "Nausea", with: @survey.nausea
    fill_in "Sensory loss", with: @survey.sensory_loss
    fill_in "Sore throat", with: @survey.sore_throat
    click_on "Create Survey"

    assert_text "Survey was successfully created"
    click_on "Back"
  end

  test "updating a Survey" do
    visit surveys_url
    click_on "Edit", match: :first

    fill_in "Body ache", with: @survey.body_ache
    fill_in "Comment", with: @survey.comment
    fill_in "Cough", with: @survey.cough
    fill_in "Diarrhea", with: @survey.diarrhea
    fill_in "Difficulty breathing", with: @survey.difficulty_breathing
    fill_in "Fatigue", with: @survey.fatigue
    fill_in "Fever chills", with: @survey.fever_chills
    fill_in "Headache", with: @survey.headache
    fill_in "Nausea", with: @survey.nausea
    fill_in "Sensory loss", with: @survey.sensory_loss
    fill_in "Sore throat", with: @survey.sore_throat
    click_on "Update Survey"

    assert_text "Survey was successfully updated"
    click_on "Back"
  end

  test "destroying a Survey" do
    visit surveys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survey was successfully destroyed"
  end
end
