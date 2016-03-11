require 'test_helper'

class Everypolitician::EventTest < Minitest::Test
  def test_reading_popolo_events
    popolo = Everypolitician::Popolo::JSON.new(
      events: [{ id: 'term/8', name: '8th Verkhovna Rada', start_date: '2014-11-27' }]
    )
    event = popolo.events.first

    assert_instance_of Everypolitician::Popolo::Events, popolo.events
    assert_instance_of Everypolitician::Popolo::Event, event
  end

  def test_accessing_event_properties
    popolo = Everypolitician::Popolo::JSON.new(
      events: [{ id: 'term/8', name: '8th Verkhovna Rada', start_date: '2014-11-27' }]
    )
    event = popolo.events.first

    assert_equal 'term/8', event.id
    assert_equal '8th Verkhovna Rada', event.name
    assert_equal '2014-11-27', event.start_date
  end
end