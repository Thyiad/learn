use strict;
use warnings;
use DateTime;
use Time::Piece;

# print "@{ARGV}tm\n";
die("请输入参数！") unless(@ARGV);
foreach(@ARGV){
	do{print "$_ 格式不正确！\n";next;} unless(m/^\s*(\d{4})\s+(\d{2})\s+(\d{2})\s*$/);
	
	print"当前参数日期为：$1 $2 $3\t";
	
	my $inputDate = DateTime->new(
		year => $1,
		month => $2,
		day => $3,
	);
	
	my $nowDate = DateTime->from_epoch(epoch=>time);
	
	my $duration = $nowDate - $inputDate;
	printf "和当前日期相差：%4d年%02d月%02d日\n", $duration->in_units('years','months','days');
	
	year mon mday hour min sec
	my $t = localtime;
	#print  $time->year." ".$time->month." ".$time->day."\n";
	print $t->sec."\n";                 # also available as $t->second
    print $t->min."\n";                 # also available as $t->minute
    print $t->hour."\n";                # 24 hour
    print $t->mday."\n";                # also available as $t->day_of_month
    print $t->mon."\n";                 # 1 = January
    print $t->_mon."\n";                # 0 = January
    print $t->monname."\n";             # Feb
    print $t->month."\n";               # same as $t->monname
    print $t->fullmonth."\n";           # February
    print $t->year."\n";                # based at 0 (year 0 AD is, of course 1 BC)
    print $t->_year."\n";               # year minus 1900
    print $t->yy."\n";                  # 2 digit year
    print $t->wday."\n";                # 1 = Sunday
    print $t->_wday."\n";               # 0 = Sunday
    print $t->day_of_week."\n";         # 0 = Sunday
    print $t->wdayname."\n";            # Tue
    print $t->day."\n";                 # same as wdayname
    print $t->fullday."\n";             # Tuesday
    print $t->yday."\n";                # also available as $t->day_of_year, 0 = Jan 01
    print $t->isdst."\n";               # also available as $t->daylight_savings
    print $t->hms."\n";                 # 12:34:56
    print $t->hms(".")."\n";            # 12.34.56
    print $t->time."\n";                # same as $t->hms
    print $t->ymd."\n";                 # 2000-02-29
    print $t->date."\n";                # same as $t->ymd
    print $t->mdy."\n";                 # 02-29-2000
    print $t->mdy("/")."\n";            # 02/29/2000
    print $t->dmy."\n";                 # 29-02-2000
    print $t->dmy(".")."\n";            # 29.02.2000
    print $t->datetime."\n";            # 2000-02-29T12:34:56 (ISO 8601)
    print $t->cdate."\n";               # Tue Feb 29 12:34:56 2000
    print $t->epoch."\n";               # seconds since the epoch
    print $t->tzoffset."\n";            # timezone offset in a Time::Seconds object
    print $t->julian_day."\n";          # number of days since Julian period began
    print $t->mjd."\n";                 # modified Julian date (JD-2400000.5 days)
    print $t->week."\n";                # week number (ISO 8601)
    print $t->is_leap_year."\n";        # true if it its
    print $t->month_last_day."\n";      # 28-31
    #print $t->time_separator($s)."\n";  # set the default separator (default ":")
    #print $t->date_separator($s)."\n";  # set the default separator (default "-")
    #print $t->day_list(@days)."\n";     # set the default weekdays
    #print $t->mon_list(@days)."\n";     # set the default months
    #print $t->strftime(FORMAT)."\n";    # same as POSIX::strftime (without the overhead
                            # of the full POSIX extension)
    print $t->strftime()."\n";          # "Tue, 29 Feb 2000 12:34:56 GMT"
}
