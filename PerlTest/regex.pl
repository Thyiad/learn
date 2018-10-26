use warnings;
use 5.010;

print "abc", "123\n";

$_="what what";
@av = /what/;
foreach(@av){
	say "$_ no";
}

@ag = split /:/, ":a:b:c:::", -1;
for(@ag){
	say "$_ yes";
}