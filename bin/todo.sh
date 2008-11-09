#! /bin/bash

# NOTE:  Todo.sh requires the .todo configuration file to run.
# Place the .todo file in your home directory or use the -d option for a custom location.

version() { sed -e 's/^    //' <<EndVersion
        TODO.TXT Manager
        Version 1.7.3
        Author:  Gina Trapani (ginatrapani@gmail.com)
        Release date:  5/11/2006
        Last updated:  7/29/2006
        License:  GPL, http://www.gnu.org/copyleft/gpl.html
        More information and mailing list at http://todotxt.com
EndVersion
    exit 1
}

usage()
{
    sed -e 's/^    //' <<EndUsage 
    Usage: todo.sh  [-fhpqvV] [-d todo_config] action [task_number] [task_description]
    Try 'todo.sh -h' for more information.    
EndUsage
    exit 1
}


help()
{ 
    sed -e 's/^    //' <<EndHelp
      Usage:  todo.sh [-fhpqvV] [-d todo_config] action [task_number] [task_description]

      Actions:
        add "THING I NEED TO DO p:project @context"
        a "THING I NEED TO DO p:project @context"
          Adds TODO ITEM to your todo.txt.
          Project and context notation optional.
          Quotes optional.

        append NUMBER "TEXT TO APPEND"
        app NUMBER "TEXT TO APPEND"
          Adds TEXT TO APPEND to the end of the todo on line NUMBER.
          Quotes optional.

        archive
          Moves done items from todo.txt to done.txt.

        del NUMBER
        rm NUMBER
          Deletes the item on line NUMBER in todo.txt.

        do NUMBER
          Marks item on line NUMBER as done in todo.txt.

        list [TERM...] 
        ls [TERM...]
          Displays all todo's that contain TERM(s) sorted by priority with line
          numbers.  If no TERM specified, lists entire todo.txt.

        listall [TERM...]
        lsa [TERM...]
          Displays all the lines in todo.txt AND done.txt that contain TERM(s)
          sorted by priority with line  numbers.  If no TERM specified, lists
          entire todo.txt AND done.txt concatenated and sorted.

        listpri [PRIORITY]
        lsp [PRIORITY]
          Displays all items prioritized PRIORITY.
          If no PRIORITY specified, lists all prioritized items.

        prepend NUMBER "TEXT TO PREPEND"
        prep NUMBER "TEXT TO PREPEND"
          Adds TEXT TO PREPEND to the beginning of the todo on line NUMBER.
          Quotes optional.

        pri NUMBER PRIORITY
        p NUMBER PRIORITY
          Adds PRIORITY to todo on line NUMBER.  If the item is already
          prioritized, replaces current priority with new PRIORITY.
          PRIORITY must be an uppercase letter between A and Z.

        replace NUMBER "UPDATED TODO"
          Replaces todo on line NUMBER with UPDATED TODO.

        remdup
          Removes exact duplicate lines from todo.txt.

        report
          Adds the number of open todo's and closed done's to report.txt.

      Options:
        -d CONFIG_FILE
            Use a configuration file other than the default ~/.todo
        -f
        	Forces actions without confirmation or interactive input
        -h
            Display this help message
        -p
            Plain mode turns off colors
        -v 
            Verbose mode turns on confirmation messages
        -V 
            Displays version, license and credits
EndHelp

    exit 1
}

die()
{
    echo "$*"
    exit 1
}

cleanup()
{
    [ -f "$TMP_FILE" ] && rm "$TMP_FILE"
    exit 0
}


# == PROCESS OPTIONS ==
# defaults
VERBOSE=0
PLAIN=0
CFG_FILE=$HOME/.todo
FORCE=0

while getopts ":fhpqvVd:" Option
do
  case $Option in
    d)  
	CFG_FILE=$OPTARG
	;;
	f)
	FORCE=1
	;;
	h)
	help
	;;
    p )
	PLAIN=1 
	;;
    q ) 
	QUIET=1
	;;
    v ) 
	VERBOSE=1
	;;
    V)
	version
	;;
  esac
done
shift $(($OPTIND - 1))

# === SANITY CHECKS (thanks Karl!) ===
[ -r "$CFG_FILE" ] || die "Fatal error:  Cannot read configuration file $CFG_FILE"

. "$CFG_FILE"

[ -z "$1" ]         && usage
[ -d "$TODO_DIR" ]  || die "Fatal Error: $TODO_DIR is not a directory"  
cd "$TODO_DIR"      || die "Fatal Error: Unable to cd to $TODO_DIR"

echo '' > "$TMP_FILE" || die "Fatal Error:  Unable to write in $TODO_DIR"  
[ -f "$TODO_FILE" ] || cp /dev/null "$TODO_FILE"
[ -f "$DONE_FILE" ] || cp /dev/null "$DONE_FILE"
[ -f "$REPORT_FILE" ] || cp /dev/null "$REPORT_FILE"


if [ $PLAIN = 1 ]; then
	PRI_A=$NONE
	PRI_B=$NONE
	PRI_C=$NONE
	PRI_X=$NONE
	DEFAULT=$NONE
fi

# === HEAVY LIFTING ===
shopt -s extglob

# == HANDLE ACTION ==
action=$( printf "%s\n" "$1" | tr 'A-Z' 'a-z' )

case $action in 
"add" | "a")
	if [[ -z "$2" && $FORCE = 0 ]]; then
		echo -n "Add: "
		read input
	else
		[ -z "$2" ] && die "usage: $0 add \"TODO ITEM\""
		shift
		input=$*
	fi
	echo "$input" >> "$TODO_FILE"

	TASKNUM=$(wc -l "$TODO_FILE" | sed 's/^[[:space:]]*\([0-9]*\).*/\1/')
	[[ $VERBOSE = 1 ]] && echo "TODO: '$input' added on line $TASKNUM."
	cleanup;;

"append" | "app" )
	errmsg="usage: $0 append ITEM# \"TEXT TO APPEND\""
	shift; item=$1; shift

	[ -z "$item" ] && die "$errmsg"
	[[ "$item" = +([0-9]) ]] || die "$errmsg"

	if [[ -z "$1" && $FORCE = 0 ]]; then
		echo -n "Append: "
		read input
	else
		input=$*
	fi

	if sed -ne "$item p" "$TODO_FILE" | grep "^."; then
		if sed -i.bak $item" s|^.*|& $input|" "$TODO_FILE"; then
		        NEWTODO=$(sed "$item!d" "$TODO_FILE")
		        [[ $VERBOSE = 1 ]] && echo "$item: $NEWTODO"
		else
			echo "TODO:  Error appending task $item."
		fi
	else
		echo "$item: No such todo."
	fi
	cleanup;;

"archive" )
	[[ $VERBOSE = 1 ]] && grep "^x " "$TODO_FILE"
	grep "^x " "$TODO_FILE" >> "$DONE_FILE"
	sed -i.bak '/^x /d' "$TODO_FILE"
        [[ $VERBOSE = 1 ]] && echo "--"
        [[ $VERBOSE = 1 ]] && echo "TODO:  Items marked as done have been moved from $TODO_FILE to $DONE_FILE."
	cleanup;;

"del" | "rm" )
	errmsg="usage: $0 del ITEM#"
	item=$2
	[ -z "$item" ] && die "$errmsg"
	[[ "$item" = +([0-9]) ]] || die "$errmsg"
	if sed -ne "$item p" "$TODO_FILE" | grep "^."; then
		DELETEME=$(sed "$2!d" "$TODO_FILE")

		if  [ $FORCE = 0 ]; then
		    echo "Delete '$DELETEME'?  (y/n)"
			read ANSWER
		else
			ANSWER="y"
		fi
		
	    if [ "$ANSWER" = "y" ]; then
		       sed -i.bak -e $2"s/^.*//" -e '/./!d' "$TODO_FILE"
		       [[ $VERBOSE = 1 ]] && echo "TODO:  '$DELETEME' deleted."
		       cleanup
		else
			echo "TODO:  No tasks were deleted."
		fi
	else
		echo "$item: No such todo."
        fi ;;

"do" )
	errmsg="usage: $0 do ITEM#"
	item=$2
	[ -z "$item" ] && die "$errmsg"
	[[ "$item" = +([0-9]) ]] || die "$errmsg"

	if sed -ne "$item p" "$TODO_FILE" | grep "^."; then
		now=`date '+%Y-%m-%d'`
		# remove priority once item is done
		sed -i.bak -e $2"s/^(.*) //" -e $2"s/^//" "$TODO_FILE"
		sed -i.bak $2"s|^|&x $now |" "$TODO_FILE"
		NEWTODO=$(sed "$2!d" "$TODO_FILE")
	        [[ $VERBOSE = 1 ]] && echo "$item: $NEWTODO"
	        [[ $VERBOSE = 1 ]] && echo "TODO: $item marked as done."
		cleanup
	else
		echo "$item:  No such todo."
	fi ;;

"list" | "ls" )
	item=$2
	if [ -z "$item" ]; then
		echo -e "`sed = "$TODO_FILE" | sed 'N; s/^/  /; s/ *\(.\{2,\}\)\n/\1 /' | sed 's/^ /0/' | sort -f -k2 | sed '/^[0-9][0-9] x /!s/\(.*(A).*\)/'$PRI_A'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*(B).*\)/'$PRI_B'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*(C).*\)/'$PRI_C'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*([A-Z]).*\)/'$PRI_X'\1'$DEFAULT'/'`"
		echo "--"
		NUMTASKS=$(wc -l "$TODO_FILE" | sed 's/^[[:space:]]*\([0-9]*\).*/\1/')
		echo "TODO: $NUMTASKS tasks in $TODO_FILE."
	else
		command=`sed = "$TODO_FILE" | sed 'N; s/^/  /; s/ *\(.\{2,\}\)\n/\1 /' | sed 's/^ /0/' | sort -f -k2 | sed '/^[0-9][0-9] x /!s/\(.*(A).*\)/'$PRI_A'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*(B).*\)/'$PRI_B'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*(C).*\)/'$PRI_C'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*([A-Z]).*\)/'$PRI_X'\1'$DEFAULT'/' | grep -i $item `
		shift
		shift
		for i in $*
			do
			command=`echo "$command" | grep -i $i `
			done
		command=`echo "$command" | sort -f -k2`

		echo -e "$command"
	fi
	cleanup ;;

"listall" | "lsa" )
	item=$2
       cat "$TODO_FILE" "$DONE_FILE" > "$TMP_FILE"

	if [ -z "$item" ]; then
		echo -e "`sed = "$TMP_FILE" | sed 'N; s/^/  /; s/ *\(.\{3,\}\)\n/\1 /' | sed 's/^  /00/' | sed 's/^ /0/' | sort -f -k2 | sed '/^[0-9][0-9][0-9] x /!s/\(.*(A).*\)/'$PRI_A'\1'$DEFAULT'/g' | sed '/^[0-9][0-9][0-9] x /!s/\(.*(B).*\)/'$PRI_B'\1'$DEFAULT'/g' | sed '/^[0-9][0-9][0-9] x /!s/\(.*(C).*\)/'$PRI_C'\1'$DEFAULT'/g' | sed '/^[0-9][0-9][0-9] x /!s/\(.*([A-Z]).*\)/'$PRI_X'\1'$DEFAULT'/'`"
	else
		command=`sed = "$TMP_FILE" | sed 'N; s/^/  /; s/ *\(.\{3,\}\)\n/\1 /' | sed 's/^  /00/' | sed 's/^ /0/' | sort -f -k2 | sed '/^[0-9][0-9][0-9] x /!s/\(.*(A).*\)/'$PRI_A'\1'$DEFAULT'/g' | sed '/^[0-9][0-9][0-9] x /!s/\(.*(B).*\)/'$PRI_B'\1'$DEFAULT'/g' | sed '/^[0-9][0-9][0-9] x /!s/\(.*(C).*\)/'$PRI_C'\1'$DEFAULT'/g' | sed '/^[0-9][0-9][0-9] x /!s/\(.*([A-Z]).*\)/'$PRI_X'\1'$DEFAULT'/' | grep -i $item `
		shift
		shift
		for i in $*
			do
			command=`echo "$command" | grep -i $i `
			done
		command=`echo "$command" | sort -f -k2`

		echo -e "$command"
	fi
	cleanup ;;

"listpri" | "lsp" )
	pri=$( printf "%s\n" "$2" | tr 'a-z' 'A-Z' )

	errmsg="usage: $0 listpri PRIORITY  
note:  PRIORITY must a single letter from A to Z."

	if [ -z "$pri" ]; then
		echo -e "`sed = "$TODO_FILE" | sed 'N; s/^/  /; s/ *\(.\{2,\}\)\n/\1 /' | sed 's/^ /0/' | sort -f -k2 |  sed 's/^ /0/' | sort -f -k2 | sed '/^[0-9][0-9] x /!s/\(.*(A).*\)/'$PRI_A'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*(B).*\)/'$PRI_B'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*(C).*\)/'$PRI_C'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*([A-Z]).*\)/'$PRI_X'\1'$DEFAULT'/'`" | grep \([A-Z]\)
		if [ $VERBOSE = 1 ]; then
			echo "--"
			NUMTASKS=$(grep \([A-Z]\) "$TODO_FILE" | wc -l | sed 's/^[[:space:]]*\([0-9]*\).*/\1/')
			echo "TODO: $NUMTASKS prioritized tasks in $TODO_FILE."
		fi
	else
		[[ "$pri" = +([A-Z]) ]] || die "$errmsg"

		echo -e "`sed = "$TODO_FILE" | sed 'N; s/^/  /; s/ *\(.\{2,\}\)\n/\1 /' | sed 's/^ /0/' |  sort -f -k2 |  sed 's/^ /0/' | sort -f -k2 | sed '/^[0-9][0-9] x /!s/\(.*(A).*\)/'$PRI_A'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*(B).*\)/'$PRI_B'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*(C).*\)/'$PRI_C'\1'$DEFAULT'/g' | sed '/^[0-9][0-9] x /!s/\(.*([A-Z]).*\)/'$PRI_X'\1'$DEFAULT'/'`" | grep \($pri\)
		if [ $VERBOSE = 1 ]; then
			echo "--"
			NUMTASKS=$(grep \($pri\) "$TODO_FILE" | wc -l | sed 's/^[[:space:]]*\([0-9]*\).*/\1/')
			echo "TODO: $NUMTASKS tasks prioritized $pri in $TODO_FILE."
		fi

	fi
	cleanup;;

"prepend" | "prep" )
	errmsg="usage: $0 prepend ITEM# \"TEXT TO PREPEND\""
	shift; item=$1; shift
	
	[ -z "$item" ] && die "$errmsg"
	[[ "$item" = +([0-9]) ]] || die "$errmsg"

	if [[ -z "$1" && $FORCE = 0 ]]; then
		echo -n "Prepend: "
		read input
	else
		input=$*
	fi


	if sed -ne "$item p" "$TODO_FILE" | grep "^."; then
		if sed -i.bak $item" s|^.*|$input &|" "$TODO_FILE"; then
		        NEWTODO=$(sed "$item!d" "$TODO_FILE")
		        echo "$item: $NEWTODO"
		else
			echo "TODO:  Error prepending task $item."
		fi
	else
		echo "$item: No such todo."
	fi
	cleanup;;
"pri" | "p" )
	item=$2
	newpri=$( printf "%s\n" "$3" | tr 'a-z' 'A-Z' )

	errmsg="usage: $0 pri ITEM# PRIORITY  
note:  PRIORITY must be anywhere from A to Z."

	[ "$#" -ne 3 ] && die "$errmsg"
	[[ "$item" = +([0-9]) ]] || die "$errmsg"
	[[ "$newpri" = +([A-Z]) ]] || die "$errmsg"

	sed -e $item"s/^(.*) //" -e $item"s/^/($newpri) /" "$TODO_FILE" > /dev/null 2>&1

        if [ "$?" -eq 0 ]; then
		#it's all good, continue
		sed -i.bak -e $2"s/^(.*) //" -e $2"s/^/($newpri) /" "$TODO_FILE"
              NEWTODO=$(sed "$2!d" "$TODO_FILE")
		[[ $VERBOSE = 1 ]] && echo -e "`echo "$item: $NEWTODO"`"
              [[ $VERBOSE = 1 ]] && echo "TODO: $item prioritized ($newpri)."
		cleanup
        else
		die "$errmsg"
	fi;;
"remdup" )
	cp "$TODO_FILE" "$TMP_FILE"
	cat "$TMP_FILE" | sed -n 'G; s/\n/&&/; /^\([ -~]*\n\).*\n\1/d; s/\n//; h; P' > "$TODO_FILE"
	[[ $VERBOSE = 1 ]] && echo "TODO: Duplicate tasks have been removed."
	cleanup;;

"replace" )
	errmsg="usage: $0 replace ITEM# \"UPDATED ITEM\""
	shift; item=$1; shift

	[ -z "$item" ] && die "$errmsg"
	[[ "$item" = +([0-9]) ]] || die "$errmsg"
	
	if [[ -z "$1" && $FORCE = 0 ]]; then
		echo -n "Replacement: "
		read input
	else
		input=$*
	fi
	
	if sed -ne "$item p" "$TODO_FILE" | grep "^."; then
		sed -i.bak $item" s|^.*|$input|" "$TODO_FILE"
		[[ $VERBOSE = 1 ]] && NEWTODO=$(head -$item "$TODO_FILE" | tail -1)
		[[ $VERBOSE = 1 ]] && echo "replaced with"
		[[ $VERBOSE = 1 ]] && echo "$item: $NEWTODO"
	else
		echo "$item: No such todo."
	fi
	cleanup;;

"report" )
	#archive first
	sed '/^x /!d' "$TODO_FILE" >> $DONE_FILE
	sed -i.bak '/^x /d' "$TODO_FILE"

    NUMLINES=$(wc -l "$TODO_FILE" | sed 's/^[[:space:]]*\([0-9]*\).*/\1/')
    if [ $NUMLINES = "0" ]; then
         echo "datetime todos dones" >> "$REPORT_FILE"
    fi
	#now report
	TOTAL=$(cat "$TODO_FILE" | wc -l | sed 's/^[ \t]*//')
	TDONE=$(cat "$DONE_FILE" | wc -l | sed 's/^[ \t]*//')
	TECHO=$(echo $(date +%Y-%m-%d-%T); echo ' '; echo $TOTAL; echo ' ';
	echo $TDONE)
	echo $TECHO >> "$REPORT_FILE"
	[[ $VERBOSE = 1 ]] && echo "TODO:  Report file updated."
	cat "$REPORT_FILE"
	cleanup;;
* )
	usage
esac

