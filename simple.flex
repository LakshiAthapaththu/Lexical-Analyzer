%{                                                                                          
#include "simple.tab.h"  
void yyerror (char const *s) {
        fprintf (stderr, "%s\n", s);
    }
                                                                    
//extern int line_number;                                                                     
%}                                                                                          
%option noyywrap                                                                            
 
%% 
"float"             { printf("FROM FLEX FLOAT %s\n", yytext); return FLOAT;  }                  
"int"               { printf("FROM FLEX INT %s\n", yytext); return INT; }     
"else"              { printf("FROM FLEX ELSE %s\n", yytext); return ELSE; } 
"if"                { printf("FROM FLEX IF %s\n", yytext); return IF; } 
"return"            { printf("FROM FLEX RETURN %s\n", yytext); return RETURN; } 
"void"              { printf("FROM FLEX VOID %s\n", yytext); return VOID; } 
"while"             { printf("FROM FLEX WHILE %s\n", yytext); return WHILE; } 
"+"                 { printf("FROM FLEX PLUS %s\n", yytext); return PLUS; }              
"-"                 { printf("FROM FLEX MINUS %s\n", yytext); return MINUS;}
"*"                 { printf("FROM FLEX MULTIPLY %s\n", yytext); return MULTIPLY;}
"/"                 { printf("FROM FLEX DEVISION %s\n", yytext); return DIVIDE;}
">"                 { printf("FROM FLEX GREATER THAN %s\n", yytext); return GREATER_THAN;}
"<"                 { printf("FROM FLEX LESS THAN %s\n", yytext); return LESS_THAN;}
"<="                { printf("FROM FLEX LESS OR EQUAL %s\n", yytext); return LESS_OR_EQUAL;}
">="                { printf("FROM FLEX GREATER THAN EQUAL %s\n", yytext); return GREATER_OR_EQUAL;}
"=="                { printf("FROM FLEX EQUALS %s\n", yytext); return EQUALS;}
"!="                { printf("FROM FLEX NOT EQUAL %s\n", yytext); return NOT_EQUALS;}
"="                 { printf("FROM FLEX ASSIGNMENT %s\n", yytext); return ASSIGNMENT ;}
";"                 { printf("FROM FLEX SEMI COLON %s\n", yytext); return SEMI_COLON ;}
","                 { printf("FROM FLEX COMMA %s\n", yytext); return COMMA;}
"{"                 { printf("FROM FLEX CURLY LEFT %s\n", yytext); return CURLY_BRACKET_LEFT;}
"}"                 { printf("FROM FLEX CURLY RIGHT %s\n", yytext); return CURLY_BRACKET_RIGHT;}
"("                 { printf("FROM FLEX BRACKET LEFT %s\n", yytext); return BRACKET_LEFT ;}
")"                 { printf("FROM FLEX BRACKET RIGHT %s\n", yytext); return BRACKET_RIGHT;}
"["                 { printf("FROM SQURE BRACKET LEFT %s\n", yytext); return SQUARE_BRACKET_LEFT;}
"]"                 { printf("FROM SQUARE BRACKET RIGHT %s\n", yytext); return SQUARE_BRACKET_RIGHT;}
"/*"                { printf("FROM FLEX COMMENT START %s\n", yytext); return COMMENT_START;}
"*/"                { printf("FROM FLEX COMMENT END %s\n", yytext); return COMMENT_END;}
[a-zA-Z][a-zA-Z]*           return ID;
[0-9][0-9]*                 return NUM;
[ \t\r]+                    ;
[\n]                        ;
.                           yyerror("Error in Syntax!");

                                                                    
%%