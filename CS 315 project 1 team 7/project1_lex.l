%option main
digit		[0-9]
letter		[A-Za-z]
alphanumeric ({digit}|{letter})
identifier	{letter}{alphanumeric}*
int 		{digit}+
double		{digit}*(\.)?{digit}+
char 		{letter}
String 		{char}+
bool 		(true|false)
if 			if
else		else
while		while
for  		for
return 		return
int_type	int
double_type	double
void_type	void
char_type	char
string_type	String
bool_type	bool
long_type 	long
comment		\#(.)*\#
leftParan	\(
rightParan	\)
leftBrace	\{
rightBrace	\}
less_eq		\<\=
great_eq	\>\=
less 		\<
great 		\>
assign		\=
equal		\=\=
plus		\+
minus		\-
mult		\*
divide		\/
semicolon	\;
comma		\,
and			\&\&
or   		\|\|
nl			\n
readTemp	readTemperature\(\)
switchTemp	switch_temp
readAirHumid	readAirHumidity\(\)
switchHumid	switch_humid
readAirPres	readAirPressure\(\)
switchAirPres	switch_pressure
readAirQual	readAirQuality\(\)
switchAirQual	switch_air_qual
readLight	readLight\(\)
switchLight	switch_light
readSoundQual	readSoundQuality\({identifier}\)
switchSoundQual	switch_sound_qual
readTime	readTimestamp\(\)
connectInternet	connectInternet\(\)
disconnectInternet	disconnectInternet\(\)
read_url	readUrl\(\)
rest 		.


%%
{if} 			printf("IF ");
{else}			printf("ELSE ");
{while} 		printf("WHILE ");
{for}			printf("FOR ");
{return}		printf("RETURN ");
{int_type}		printf("INT_TYPE ");
{double_type}	printf("DOUBLE_TYPE ");
{void_type}		printf("VOID_TYPE ");
{char_type}		printf("CHAR_TYPE ");
{string_type}	printf("STRING_TYPE ");
{bool_type}		printf("BOOL_TYPE ");
{long_type}		printf("LONG_TYPE ");
{leftParan}  	printf("LP ");
{rightParan}	printf("RP ");
{leftBrace}		printf("LB ");
{rightBrace}	printf("RB ");
{less_eq}		printf("LESS_EQ ");
{great_eq} 		printf("GREAT_EQ ");
{less}			printf("LESS ");
{great}			printf("GREAT ");
{assign}		printf("ASSIGN_OP ");
{equal}			printf("EQUAL ");
{plus}			printf("PLUS ");
{minus}			printf("MINUS ");
{mult}			printf("TIMES ");
{divide}		printf("DIVIDE ");
{semicolon}		printf("SEMICOLON ");
{comma}			printf("COMMA ");
{and}			printf("AND ");
{or}			printf("OR ");
{readTemp}		printf("READ_TEMP ");
{switchTemp}	printf("SWITCH_TEMP ");
{readAirHumid}	printf("READ_AIR_HUMID ");
{switchHumid}	printf("SWITCH_HUMID ");
{readAirPres}	printf("READ_AIR_PRES ");
{switchAirPres}	printf("SWITCH_AIR_PRES ");
{readAirQual}	printf("READ_AIR_QUALITY ");
{switchAirQual}	printf("SWITCH_AIR_QUAL ");
{readLight}		printf("READ_LIGHT ");
{switchLight}	printf("SWITCH_LIGHT ");
{readSoundQual}	printf("READ_SOUND_QUAL ");
{readTime}		printf("READ_TIMESTAMP ");
{connectInternet}	printf("CONNECT_INTERNET ");
{disconnectInternet}	printf("DISCONNECT_INTERNET ");
{read_url}		printf("READ_URL ");
{bool}			printf("BOOL ");
{int}			printf("INT ");
{double} 		printf("DOUBLE ");
{char}			printf("CHAR ");
{comment}		printf("COMMENT ");
{identifier}	printf("IDENTIFIER ");
{String}		printf("STRING ");
{nl} 			printf("NL ");
.				;