%token COMMENT IF ELSE WHILE FOR RETURN INT_TYPE DOUBLE_TYPE
%token VOID_TYPE CHAR_TYPE STRING_TYPE BOOL_TYPE LONG_TYPE
%token LP RP LB RB LESS_EQ GREAT_EQ LESS GREAT ASSIGN_OP
%token COMMENT DIGIT IF ELSE WHILE FOR RETURN INT_TYPE DOUBLE_TYPE
%token VOID_TYPE CHAR_TYPE STRING_TYPE BOOL_TYPE LONG_TYPE PLUS_OP MINUS_OP
%token LP RP LB RB LESS_EQ GREAT_EQ LESS GREAT ASSIGN_OP BLOCK_BEGINS
%token BLOCK_ENDS EQUAL PLUS MINUS TIMES DIVIDE SEMICOLON COMMA AND OR DOT
%token SENSOR_TEMP SENSOR_AIR_HUMID SENSOR_AIR_PRES 
%token SENSOR_AIR_QUAL SENSOR_LIGHT SENSOR_SOUND_QUAL
%token SENSOR_TIMESTAMP CONNECT_INTERNET DISCONNECT_INTERNET
%token READ_URL BOOL INT DOUBLE CHAR STRING IDENTIFIER NL TIMER
%%

program: stmt_list;				

stmt_list: stmt_list stmt | stmt;

stmt: assign_stmt
	| declare_stmt
	| if_stmt
	| loops
	| comment_stmt
	| empty 
	| return_stmt 
| functions
| function
| function_call;


assign_stmt : variable  ASSIGN_OP expression SEMICOLON ;

declare_stmt : type variable ASSIGN_OP expression SEMICOLON ;
| type variable SEMICOLON

variable : IDENTIFIER ;

if_stmt : matched | unmatched ;

matched : IF LB logic_expression RB if_stmt ;

unmatched : IF LB logic_expression RB if_stmt
		| IF LB logic_expression RB matched
		ELSE unmatched ;

loops : while_loop | for_loop ;

while_loop : WHILE LB logic_expression RB BLOCK_BEGINS 
		stmt BLOCK_ENDS    ;  

for_loop : FOR LB declare_stmt SEMICOLON logic_expression SEMICOLON assign_stmt RB BLOCK_BEGINS stmt_list BLOCK_ENDS ;
              
logic_expression : logic_expression connection_op
logic_expression 
| variable comparison_op variable 
		| boolean_stmt ;

boolean_stmt : variable ASSIGN_OP BOOL ;

comparison_op :  GREAT | LESS | EQUAL | LESS_EQ | GREAT_EQ;

connection_op : OR | AND;

expression : expression PLUS_OP term SEMICOLON
		| expression MINUS_OP term SEMICOLON
 		| term SEMICOLON;

term :  term MULTIPLY digit_list
	|term DIVIDE digit_list
 	|term ;

comment_stmt : COMMENT;

function : type function_name LB paramet RB BLOCK_BEGINS stmt return_stmt BLOCK_ENDS
		| type function_name LB   
 		paramet RB BLOCK_BEGINS stmt BLOCK_ENDS
		| type function_name LB empty RB BLOCK_BEGINS stmt return_stmt BLOCK_ENDS
 		| type function_name LB empty RB BLOCK_BEGINS stmt BLOCK_ENDS;

return_stmt : RETURN empty | RETURN variable | return BOOL;

type : VOID_TYPE | INT_TYPE | CHAR_TYPE | DOUBLE_TYPE
		| STRING | BOOL_TYPE | LONG_TYPE | TIMER;


digit_list : digit_list DIGIT | DIGIT ;

func_call : function_name LB paramet RB
 		| function_name LB empty RB;

function_name : variable;

paramet : type variable COMMA paramet | type variable;

empty : ;

functions : read_sensor | switch | sensor_timestamp | internet 

read_sensor : sensor_temperature | sensor_humidity 
	|sensor_pressure | sensor_air_quality 
	| sensor_light | sensor_sound;

sensor_temperature : SENSOR_TEMP;

sensor_humidity : SENSOR_AIR_HUMID;

sensor_pressure : SENSOR_AIR_PRES;

sensor_air_quality : SENSOR_AIR_QUAL;

sensor_light : SENSOR_LIGHT;

sensor_sound :  SENSOR_SOUND_QUAL;

switch : BOOL_TYPE;

sensor_timestamp : SENSOR_TIMESTAMP;

internet : internet| connect_internet | disconnect_internet | read_url | url ;

connect_internet : CONNECT_INTERNET;

disconnect_internet : DISCONNECT_INTERNET;

read_url : READ_URL;

url : INT DOT INT DOT INT DOT INT;

%%

#include “lex.yy.c”
int yylineno= 1;

int yyerror(char *s){
	printf(stderr , “%s, line: %d\n”, s, yylineno);
	return 1;
}

int main(){
	yyparse();
	return 0;
}
