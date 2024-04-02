
BEGIN {
	indentationLevel=0
	RS=" "
	ORS=" "
	OFS=" "
	isTemplate="false"
	isExecuting="false"
	isAt=false
}

/template:/ {
	isTemplate="true"
	isExecuting="false"
	isAt=false
	printf "\n"
	indentationLevel=2
	for (i = 0; i <= indentationLevel; i += 1) printf " "
	printf "%s", $0
	next
}

/executing/ {
	isExecuting="true"
	isTemplate="false"
	isAt="false"
	printf "\n"
	indentationLevel=4
	for (i = 0; i <= indentationLevel; i += 1) printf " "
	printf "%s", $0
	next
}

$0 == "at" {
	isTemplate="false"
	isExecuting="false"
	isAt="true"
	printf "\n"
	indentationLevel=6
	for (i = 0; i < indentationLevel; i += 1) printf " "
	printf "%s", $0
	next
}

/>:$/ {
	if ( isAt == "true"){
		printf "\033[32m"
	}
	isAt="false"
	printf " %s", substr($0, 1, length($0) - 1)
	printf "\033[0m"
	printf ":"
	printf "\n"
	next
}

{
	if (isTemplate == "true"){
		printf "\033[36m"
	}
	if (isExecuting == "true") {
		printf "\033[35m"
	}
	if ( isAt == "true"){
		printf "\033[32m"
	}
	printf " %s", $0

	if (isAt == "true" || isExecuting == "true" || isTemplate == "true") {
		printf "\033[0m"
	}
	isTemplate="false"
	isExecuting="false"
}

