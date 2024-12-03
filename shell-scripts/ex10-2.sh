#!/bin/bash

# Very basic html website browser

# Setup
readonly DEFAULT=https://tldp.org/LDP/Bash-Beginners-Guide/html/index.html
readonly TMP_FILE=TMP_FILE
readonly HISTORYLIMIT=10
declare -a HISTORY

while true;do
    # Get input on starting website
    echo "Enter the URL you would like to load, b to load last site, h to print history, q to quit, or enter for default"

    # Check array index exists
    if [ ! "${#HISTORY[@]}" == 0 ];then
        echo "Last site: ${HISTORY[-1]}"
    fi

    # Get choice
    read -p 'Choice: ' choice
    # Check input
    case $choice in
        "")
            SITE=$DEFAULT
            ;;
        q)
            echo "Quitting..."
            exit 0
            ;;
        b)  
            # Cant access history if nothing visited yet
            if [ ! "${#HISTORY[@]}" == 0 ];then
                SITE="${HISTORY[-1]}"
            else
                echo "No previously visited URL's, try again"
                continue
            fi
            ;;
        h)
            # Cant access history if nothing visited yet
            if [ ! "${#HISTORY[@]}" == 0 ];then
                echo "URL history"
                for hist in "${HISTORY[@]}";do
                    echo "$hist"
                done
            else
                echo "No previously visited URL's, try again"
                echo
            fi
            echo
            continue
            ;;
        *)
            SITE="$choice"
            ;;
    esac

    echo "Site chosen: $SITE"

    # Download and display starting page
    # Should probably check that site ends in .html

    # Downloads $SITE and stores locally under $PAGE
    wget -qO $TMP_FILE $SITE

    if [ ! $? == 0 ];then    # If wget failed
        echo "Invalid URL entered, try again"
        echo
        rm $TMP_FILE # It seems to create empty file even if download fails
        continue
    fi

    links -dump $TMP_FILE
    echo

    # Store successful last 10 urls in history
    # Only store a new site if you arent going backwards, if going backwards remove last element
    if [ ! "$choice" == "b" ];then
        HISTORY+=("$SITE")
        # If more than HISTORYLIMIT elements stored in history, remove first
        if [ "${#HISTORY[@]}" -gt "$HISTORYLIMIT" ];then
            HISTORY=("${HISTORY[@]:1}")
        fi
    else
        unset HISTORY[-1]
    fi

    # Cleanup to prevent duplicate downloads with same name
    rm $TMP_FILE
done