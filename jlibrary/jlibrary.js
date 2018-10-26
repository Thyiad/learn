/**
 * Copyright (c) 2013 Thyiad
 * Author: Thyiad
 * Create date: 13/10/14 9:18
 */
(function(window) {
    var
    _jlibrary,

    jlibrary=function(){

    }

    jlibrary.fn=jlibrary.prototype=function(){
        
    }
	// Arguments, Array, Boolean, Date, Error, Function, JSON, Math, Number, Object, RegExp, String, Null, Undefined
	jlibrary.prototype.is = function(type, obj) {
		var clas = Object.prototype.toString.call(obj).slice(8, -1);
		return obj !== undefined && obj !== null && clas === type;
	}
})(window);