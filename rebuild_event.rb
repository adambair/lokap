


def rebuild_events(set)
  sub = Subscription.find(set.sub_id.downcase)

  set.events.each do |evt_id|
    stripe = Stripe::Event.retrieve(evt_id)
    log = sub.events.create(
      payload: stripe,
      event: stripe.type,
      actor: sub.subscriber
    )
    set.results << log
  end

  set
end




recovery_set = OpenStruct.new(
  sub_id: '9Z-N79',
  events: [
    'evt_AEwYZJqlFp4eYO',
    'evt_AEwYhBYJAJKd5f',
    'evt_AEwY5k6dHQBT0d'
  ],
  results: []
)

rebuild_events(recovery_set)

recovery_set = OpenStruct.new(
  sub_id: '94-DY9',
  events: [
    'evt_AEyIV5yxVZNVp3',
    'evt_AEyIfNwuoEyBhi',
    'evt_AEyIfTVJH27lxk'
  ],
  results: []
)

rebuild_events(recovery_set)
s = recovery_set.results.last.reference

recovery_set = OpenStruct.new(
  sub_id: 'MV-G59',
  events: [
    'evt_AEy7wjwUk1Vd5Y',
    'evt_AEy7jhq74t7zKb',
    'evt_AEy7smZ9HTTt1v'
  ],
  results: []
)

rebuild_events(recovery_set)
s = recovery_set.results.last.reference


rebuild_events(recovery_set)

e = (customer.subscription.created)

s.update_attributes \
  start_date: Time.zone.at(e.data.current_period_start),
  end_date:   Time.zone.at(e.data.current_period_end)
s.active!



recovery_set = OpenStruct.new(
  sub_id: 'M3-DE9',
  events: [
    'evt_AExzqicN6cSaaa',
    'evt_AExzMzWOHXaY2L',
    'evt_AExzUHfAxUblWQ'
  ],
  results: []
)

rebuild_events(recovery_set)
s = recovery_set.results.last.reference
e = recovery_set.restuls.last

s.update_attributes \
  start_date: Time.zone.at(e.data.current_period_start),
  end_date:   Time.zone.at(e.data.current_period_end)
s.active!

# evt_AExFJn2wPQKMSR
#
recovery_set = OpenStruct.new(
  sub_id: 'MN-759',
  events: [
    'evt_AExFaNZPnseckA',
    'evt_AExFtBWAJSe8Y7',
    'evt_AExFJn2wPQKMSR',
    'evt_AExGneB6Nkje3S'
  ],
  results: []
)


rebuild_events(recovery_set)
s = recovery_set.results.last.reference


s.update_attributes \
  start_date: Time.zone.at(started_at),
  end_date:   Time.zone.at(ended_at)

s.update_columns \
  start_date: Time.zone.at(started_at),
  end_date:   Time.zone.at(ended_at)


