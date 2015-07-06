package miltonkeynespm;
use Dancer2;
use DateTime;
use Data::Dumper;
use Lingua::EN::Numbers::Ordinate;
use YAML qw/LoadFile/;

our $VERSION = '0.1';


get '/' => sub {
    my $appdir = config->{appdir};
    my $techmeet = undef;
	my $techdate;
    if (-f "$appdir/techmeet.yml") {
        my ($hashref, $arrayref, $string) = LoadFile("$appdir/techmeet.yml");
        $techmeet = $hashref->{techmeet};
        my ($day, $month, $year) = split('/', $techmeet->{Date});
        $techdate = DateTime->new(year => $year, month => $month, day => $day);
        $techmeet->{Date_Formatted} = format_date($techdate);
    }
    debug Dumper($techmeet);
	if ($techdate and $techdate >= DateTime->now()){
		template 'index', { social => format_date(next_social()),
							techmeet => $techmeet,
							};
	}
	else {
		template 'index', { social => format_date(next_social()),
							};
	}
};

sub format_date {
	my $date = shift;
	return join(" ", $date->day_name().',', ordinate($date->day), $date->month_name, $date->year);
}
sub next_social {
	my $today = DateTime->today();
	my $day = nth_day_of_month(2, 2, $today->year, $today->month);
	if ($day < $today) {
		my $next_month = $today->month + 1;
		my $year = $today->year;
		if ($next_month > 12) {
			$year++;
			$next_month = 1;
			debug "$next_month $year";
		}
		$day = nth_day_of_month(2, 2, $year, $next_month);
	}
	debug "Next social ".$day->ymd('-');
	return $day;
}
sub nth_day_of_month {
  my ($nth, $dow, $year, $month) = @_;

  my ($date, $delta);
  if ($nth > 0) {
    # For 1st etc. we want the last day of that week (i.e. 7, 14, 21, 28, "35")
    $date  = DateTime->new(year => $year, month => $month, day => 1);
    $delta = $nth * 7 - 1;
  } else {
    # For last etc. we want the last day of the month
    # (minus a week if next-to-last, etc)
    $date  = DateTime->last_day_of_month(year => $year, month => $month);
    $delta = 7 * ($nth + 1); # $nth is negative
  }

  # Back up to the first $dow on or before $date + $delta
  $date->add(days => $delta - ($date->day_of_week + $delta - $dow) % 7);

  # If we're not in the right month, then that month doesn't have the
  # specified date (e.g. there's no 5th Tuesday in Sept. 2013).
  return (($date->month == $month) ? $date : undef);
}
true;
