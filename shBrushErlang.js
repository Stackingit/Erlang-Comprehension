/**
 * Code Syntax Highlighter.
 * Version 1.5.2
 * Copyright (C) 2006 Shin, YoungJin
 * Copyright (C) 2004-2008 Alex Gorbatchev
 * http://www.dreamprojections.com/syntaxhighlighter/
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, version 3 of the License.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

dp.sh.Brushes.Erlang = function()
{
	var datatypes =''; 
	
	var keywords = 
	'after and andalso band begin bnot bor bsl bsr bxor '+  
  'case catch cond div end fun if let not of or orelse '+  
  'query receive rem try when xor'+  
  ' module export import define';
        
    this.regexList = [
		  { regex: new RegExp("[A-Z][A-Za-z0-9_]+",      'g'), css: 'vars' },  
      { regex: new RegExp("\\%.+",                  'gm'), css: 'comment' },  
      { regex: new RegExp("\\?[A-Za-z0-9_]+",        'g'), css: 'preprocessor' },  
      { regex: new RegExp("[a-z0-9_]+:[a-z0-9_]+",   'g'), css: 'mod_func' },  
        
      { regex: new RegExp('"(?!")(?:\\.|\\\\\\"|[^\\""\\n\\r])*"', 'gm'), css: 'string' },  
      { regex: new RegExp("'(?!')(?:\\.|(\\\\\\')|[^\\''\\n\\r])*'", 'gm'), css: 'string' },  

      { regex: new RegExp(this.GetKeywords(keywords), 'gm'), css: 'keyword' }
		];

	this.CssClass = 'dp-erl';
	this.Style =	'.dp-erl .datatypes { color: #2E8B57; font-weight: bold; }';
};

dp.sh.Brushes.Erlang.prototype	= new dp.sh.Highlighter();
dp.sh.Brushes.Erlang.Aliases	= ['erl', 'erlang'];
