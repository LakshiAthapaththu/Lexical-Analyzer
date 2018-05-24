%{                                                                                   
     #include <stdarg.h>
    #include "simple_shared.h"
    #define YYSTYPE char *
    void yyerror(const char *s);
    int yylex();
    int yydebug = 1;
    int indent = 0;
    char *iden_dum;                                                                  
%}                                                                                   

%token WHILE
%token FLOAT
%token PLUS
%token MINUS
%token MULTIPLY
%token DIVIDE
%token LESS_THAN
%token LESS_OR_EQUAL
%token IF
%token ELSE
%token INT
%token RETURN
%token ASSIGNMENT
%token NOT_EQUALS
%token SEMI_COLON
%token COMMA
%token VOID
%token GREATER_THAN
%token GREATER_OR_EQUAL
%token EQUALS
%token SQUARE_BRACKET_RIGHT
%token SQUARE_BRACKET_LEFT
%token COMMENT_START
%token COMMENT_END
%token ID
%token NUM
%token CURLY_BRACKET_LEFT
%token CURLY_BRACKET_RIGHT
%token BRACKET_LEFT
%token BRACKET_RIGHT
                                                                    
 
%% /* Grammar rules and actions follow */                                           

program:                                                                         
       declaration-list                                                              
;

declaration-list:
       declaration-list declaration |
       declaration
;

declaration:
      var-declaration |
      fun-declaration
;

var-declaration:
      type-specifier ID SEMI_COLON
      | type-specifier ID SQUARE_BRACKET_LEFT  NUM SQUARE_BRACKET_RIGHT SEMI_COLON
;

type-specifier:
      INT | VOID
;

fun-declaration:
      type-specifier ID BRACKET_LEFT params BRACKET_RIGHT compound-stmt
;

params:
      param-list | 
      VOID
; 
param-list:
       param-list COMMA param| 
       param;

param:
       type-specifier ID | 
       type-specifier ID  SQUARE_BRACKET_LEFT SQUARE_BRACKET_RIGHT ; 

compound-stmt:
        CURLY_BRACKET_LEFT local-declarations statement-list CURLY_BRACKET_RIGHT;           

local-declarations:
         local-declarations var-declaration |
         %empty
 ;

statement-list:
         statement-list statement | 
         %empty;

statement:
          expression-stmt | 
          compound-stmt | 
          selection-stmt | 
          iteration-stmt |
          return-stmt ;     

expression-stmt:
            expression SEMI_COLON |
            SEMI_COLON ;

selection-stmt:
             IF BRACKET_LEFT expression BRACKET_RIGHT statement | 
             IF BRACKET_LEFT expression BRACKET_RIGHT statement ELSE  statement;

iteration-stmt:
     WHILE BRACKET_LEFT expression BRACKET_RIGHT statement;

return-stmt:
     RETURN SEMI_COLON | 
     RETURN expression SEMI_COLON;

expression:
     var ASSIGNMENT expression | 
     simple-expression  ;

var:
     ID | ID SQUARE_BRACKET_LEFT expression SQUARE_BRACKET_RIGHT;

simple-expression:
      additive-expression relop additive-expression|
      additive-expression
;

relop:
      LESS_THAN | 
      LESS_OR_EQUAL |
      GREATER_THAN | 
      GREATER_OR_EQUAL | 
      EQUALS | 
      NOT_EQUALS
;

additive-expression:
      additive-expression addop term | 
      term     
;

addop:
      PLUS|
      MINUS
;     

term:
      term mulop factor | 
      factor 
; 

mulop:
      MULTIPLY | 
      DIVIDE
;  

factor:
  BRACKET_LEFT expression BRACKET_RIGHT | 
  var | 
  call | 
  NUM;

call:
  ID BRACKET_LEFT args BRACKET_RIGHT;

args:

    arg-list | 
    %empty;

arg-list:
 arg-list COMMA expression | 
 expression;                       

%%                                                                                   


int main ()                                                                              
{                                                                                    
  yyparse ();                                                                        
}