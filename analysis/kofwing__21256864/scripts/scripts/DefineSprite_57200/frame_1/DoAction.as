var matrix = new Array(0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0.3,0.6,0.08,0,0,0,0,0,1,0);
var greyFilter = new flash.filters.ColorMatrixFilter(matrix);
var filterArray = new Array();
filterArray.push(greyFilter);
this.filters = filterArray;
this.blendMode = "subtract";
