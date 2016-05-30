// JavaScript Document
var keyline = 1;
var timems = true;

function $(e)
{
	return document.getElementById(e);
}

function log(txt,clear){
	txt= txt.toString();
	$('logArea').value = clear?txt:($('logArea').value+txt+'\n');
}

String.prototype.trimStart=function(){
	return this.replace(/^\s+/gi,'');
}
String.prototype.trimEnd=function(){
	return this.replace(/\s+$/gi,'');
}

function createMongoData(){
	var result = {};
	var lineArray = $('sourceArea').value.split('\n');
	
	var levelSpaceLen = 3;
	var regexEnd = /\s+$/gi;
	var regexStart=/^\s+/gi;
	var regexType=/\([^)]+\)/gi;
	
	var levelObj={
		l0:result,
	}
	lineArray.forEach(function(item,idx){
		var level = getLevel(item);
		var type = '';
		
		var trimAll = item.trim();
		var typeStr = regexType.exec(trimAll);
		
		if(typeStr){
			type=typeStr[0].substring(1,typeStr[0].length-1)
		}
		
		trimAll = trimAll.replace(regexType,'');
		
		var listItem = type.split('/');
		var current = null;
		
		
		// 类型是下拉，则设置为下拉的随机项
		if(listItem.length > 1){
			var itemIdx = Math.floor(Math.random()*listItem.length+0);
			current = listItem[itemIdx];
		// 类型是数组
		}else if(type === 'array'){
			current=[];
		// 没有类型、有子属性，设置为对象
		}else if(getLevel(lineArray[idx+1]) > level){
			current= {};
		// 没有类型、没有子属性就设置为相同的文本
		}else {
			current = trimAll;
		}
		
		if(Object.prototype.toString.call(current) === "[object Array]"){
			if(getLevel(lineArray[idx+1]) > level){
				current.push({});
			}else{
				current.push=(trimAll);
			}
		}
		
		var levelPre = levelObj['l'+(level-1).toString()];
		if(Object.prototype.toString.call(levelPre) === "[object Array]"){
			levelPre=levelPre[0];
		}
		
		levelPre[trimAll]= levelObj['l'+level.toString()] = current;
	})
	
	log(JSON.stringify(result),true);
	
	function getLevel(str){
		if(str === null || str === undefined) return 1;
		
		var levelSpace = str.trimEnd().match(regexStart);
		if(levelSpace){
			return (levelSpace[0].length/levelSpaceLen)+1;
		}else{
			return 1;
		}
	}
}

function executeCode()
{
    try
    {
        eval($('sourceArea').value);
    }
    catch(exception)
    {
		log(exception);
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