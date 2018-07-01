require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Component", with: @event.component_id
    fill_in "Maintenance", with: @event.maintenance
    fill_in "Message", with: @event.message
    fill_in "Name", with: @event.name
    fill_in "Notify", with: @event.notify
    fill_in "Occourred At", with: @event.occourred_at
    fill_in "Situation", with: @event.situation_id
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Component", with: @event.component_id
    fill_in "Maintenance", with: @event.maintenance
    fill_in "Message", with: @event.message
    fill_in "Name", with: @event.name
    fill_in "Notify", with: @event.notify
    fill_in "Occourred At", with: @event.occourred_at
    fill_in "Situation", with: @event.situation_id
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
