#!/bin/sh
##
# TODO add parameter for output path
# TODO add usage string
# TODO verify variables
##
# variables
title="New Post"
linkpost=
permalink=
postdate=`date +%Y-%m-%d`
posttime=`date +%H:%M:%S`
publishdate="$postdate $posttime"
tags=
categories=
openfile=false
#
# parameter handling
while getopts "n:t:c:l:d:p:o" arg
do
    # echo "ARG is $arg"
    case "$arg" in
        n) title="$OPTARG";;
        l) link_post="$OPTARG";;
        d) publishdate="$OPTARG"
           postdate=`date -jf "%F %T" "$publishdate" +%Y-%m-%d`
           posttime=`date -jf "%F %T" "$publishdate" +%H:%M:%S`;;
        p) permalink="$OPTARG";;
        o) openfile=true;;
        t) tags="$OPTARG";;
        c) categories="$OPTARG";;
        -) break;;
        \?) ;;
        *) echo "unhandled option $arg";;
        ?) echo $usage_string
        exit 1;;
    esac
done
##
# create the file name
lowercase=`echo $title | awk '{print tolower($0)}'`
stripped=`echo ${lowercase// /-}`
filename=$postdate-$stripped.md
file=_posts/$filename
##
# create the file and add content
{
    echo "---"
    echo "title: \"$title\""
    if [ -z "$linkpost" ]; then
        echo "layout: post"
    else
        echo "layout: post-link"
        echo "post_link: $linkpost"
    fi
    echo "published: false"
    if [ -z "$categories" ]; then
        echo "categories: Thoughts"
    else
        echo "categroies: $categories"
    fi
    echo "tags: $tags"
    echo "date: $publishdate"
    echo "---"
    echo
    echo "Content goes here."
} > $file
##
# open file if wanted
if $openfile; then
    emacsclient $file
fi
