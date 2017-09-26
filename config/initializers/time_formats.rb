Time::DATE_FORMATS[:short_ordinal] = ->(time) { time.strftime("%b #{time.day.ordinalize}, %Y") }
