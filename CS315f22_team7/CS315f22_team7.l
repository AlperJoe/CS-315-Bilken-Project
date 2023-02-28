%option yylineno

digit			[0-9]
letter			[A-Za-z]
alphanumeric	 ({digit}|{letter})
identifier		{letter}{alphanumeric}*
int 			{digit}+
double			{digit}*(\.)?{digit}+
char 			{letter}
String 			{char}+
bool 			(true|false)
if 				if
else			else
while			while
for  			for
return 			return
int_type		int
double_type		double
void_type		void
char_type		char
string_type		String
bool_type		bool
long_type 		long
timer_type		Timer
comment			\#(.)*\#
leftParan		\(
rightParan		\)
leftBrace		\{
rightBrace		\}
less_eq			\<\=
great_eq		\>\=
less 			\<
great 			\>
assign			\=
equal			\=\=
plus			\+
minus			\-
mult			\*
divide			\/
semicolon		\;
comma			\,
and				\&\&
or   			\|\|
nl				\n
dot 			\.
sensorTemp		sensorTemperature\(\)
sensorAirHumid	sensorAirHumidity\(\)
sensorAirPres	sensorAirPressure\(\)
sensorAirQual	sensorAirQuality\(\)
sensorLight		sensorLight\(\)
sensorSoundQual	sensorSoundQuality\({identifier}\)
sensorTime		sensorTimestamp\(\)
connectInternet	connectInternet\(\)
disconnectInternet	disconnectInternet\(\)
read_url		readUrl\(\)
rest 			.

%%

{comment}		return COMMENT;
{if} 			return IF;
{else}			return ELSE;
{while} 		return WHILE;
{for}			return FOR;
{return}		return RETURN;
{int_type}		return INT_TYPE;
{double_type}	return DOUBLE_TYPE;
{void_type}		return VOID_TYPE;
{char_type}		return CHAR_TYPE;
{string_type}	return STRING_TYPE;
{bool_type}		return BOOL_TYPE;
{long_type}		return LONG_TYPE;
{timer_type}	return TIMER;
{leftParan}  	return LP;
{rightParan}	return RP;
{leftBrace}		return LB;
{rightBrace}	return RB;
{less_eq}		return LESS_EQ;
{great_eq} 		return GREAT_EQ;
{less}			return LESS;
{great}			return GREAT;
{assign}		return ASSIGN_OP;
{equal}			return EQUAL;
{plus}			return PLUS;
{minus}			return MINUS;
{mult}			return TIMES;
{divide}		return DIVIDE;
{semicolon}		return SEMICOLON;
{comma}			return COMMA;
{and}			return AND;
{or}			return OR;
{dot}			return DOT;
{sensorTemp}	return SENSOR_TEMP;
{sensorAirHumid}	return SENSOR_AIR_HUMID;
{sensorAirPres}	return SENSOR_AIR_PRES;
{sensorAirQual}	return SENSOR_AIR_QUALITY;
{sensorLight}	return SENSOR_LIGHT;
{sensorSoundQual}	return SENSOR_SOUND_QUAL;
{sensorTime}	return SENSOR_TIMESTAMP;
{connectInternet}	return CONNECT_INTERNET;
{disconnectInternet}	return DISCONNECT_INTERNET;
{read_url}		return READ_URL;
{bool}			return BOOL;
{int}			return INT;
{double} 		return DOUBLE;
{char}			return CHAR;
{identifier}	return IDENTIFIER;
{nl} 			return NL;
{rest}				;

%%

int yywrap(){
	return 1;
}