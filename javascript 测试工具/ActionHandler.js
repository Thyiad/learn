// JavaScript Document
var keyline = 1;
var timems = true;

function $(e)
{
	return document.getElementById(e);
}

function executeCode()
{
    try
    {
        eval($('sourceArea').value);
        if($('sourceArea').value!==''){
            $('logArea').value='';
        }
    }
    catch(exception)
    {
        $('logArea').value=exception;
    }
}

function empty(){
    $('sourceArea').value='';
    $('sourceArea').select();
}

function FormatCode() {

	var js_source = $('sourceArea').value.replace(/^\s+/, '');
	var tabsize = $('tabsize') ? $('tabsize').value : 1;
	var tabchar = ' ';
	if (tabsize == 1) {
		tabchar = '\t';
	}
	if (js_source && js_source.charAt(0) === '<')
	{
		$('sourceArea').value = style_html(js_source, tabsize, tabchar, 80);
	} else
	{
		$('sourceArea').value = js_beautify(js_source, tabsize, tabchar);
	}
	
	return false;
}

function pack_js(base64) {
	var input = $('sourceArea').value;
	var packer = new Packer;
	if (base64) {
		var output = packer.pack(input, 1, 0);
	} else {
		var output = packer.pack(input, 0, 0);
	}
	$('sourceArea').value = output;
}

function decode() {
  var code = $('sourceArea').value;
  code = code.replace(/^eval/, '');
  $('sourceArea').value = eval(code);
}
function mydecode(){
	var code = $('sourceArea').value;
	code = code.replace(/\\x[\da-z]{2}/gi, function ($0) {
        return eval("'"+$0+"'")
    });
	$('sourceArea').value = code;
}
function GetFocus() {
	$('sourceArea').focus();
}

function getCount(str1,str2)
{
	return str1.match(/\str2/gi).length;
}

function onChange(e){

}

function linekeyup(e)
{
	e = e || window.event;
	if(e.keyCode == 13)
	{
		$('line').innerHTML = $('line').innerHTML + '<b>' + keyline + '</b>';
		keyline++;
	}
	else if(e.keyCode == 8)
	{
		if(keyline > 1)
		{
			scrollall();
			//keyline--;
		}
	}
}

function scrollii()
{
	$('line').scrollTop = $('sourceArea').scrollTop;
}

function scrollall()
{
	if(timems == true)
	{
		var count = $('sourceArea').value.split('\n').length + 1;
		if(count != keyline)
		{
			var tagB = [];
			$('line').innerHTML = '';
			for(i=1;i<count;i++)
			{
				tagB.push('<b>'+i+'</b>');
			}
			$('line').innerHTML = $('line').innerHTML + tagB.join('');
			keyline = count;
			timems = false;
			setTimeout('timems = true;',100);
		}
	}
}