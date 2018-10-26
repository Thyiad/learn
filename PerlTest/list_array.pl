$dis="\n\n";

&marine(1);
sub marine{
	my($p1, $p2)=@_;
	$p1+=3;
	print $p1."\n";
	$p2+=3;
	print $p2;
}

@lines=<STDIN>;
chomp(@lines);
print "Readed is: @lines\n".$#lines;
@fred=qw(abc def gjk);


print "Ihave ", scalar @fred, " rocks!\n";
print"is: ".@fred." ZZZ\n";
print @fred;
print $dis;

while(($index, $value) = each @fred){
	print "$index: $value";
}

print $dis;

foreach $rock (qw(vl2 djr erj)){
	print $rock;
}
print $dis;
$y=2-1;
$x="${fred[$y-1]}"."\n";
print $x;
$x="@fred[${y}-1]";
print $x;

print"value is: @fred xxx";

$fred="abcfeg";
$fred[0]="ABC";
$fred[1]="DEF";
print"value is: @fred xxx";

print$fred[0]."\n";
print$fred;
print$dis;

$fred[1].="DEF";
print"\n".$fred[1];
print$dis;

print "-1: ".$fred[-2];

$barney="ABCFEG";
($fred, $barney)=($barney, $fred);	 
print"fred: ".$fred."\n";
print"barney: ".$barney."\n"

