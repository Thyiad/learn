use warnings;
use diagnostics;

$tmp = ("12d33" == "12");
if(defined($tmp)){
	print "aaa".$tmp."ccc";
}else{
	print "dddd";
}
if($tmp eq ""){
	print "eq";
}
if($tmp == 1){
	print "==";
}
if($tmp eq undef){
	print "undef";
}