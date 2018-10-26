use strict;
use warnings;

my $line= "123,abc";
$line=~s/(\w+),\w+/$1/g;

print $line;