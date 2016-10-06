---
title: "Hello World!"
layout: single
published: true
categories: Thoughts
tags:
date: 2016-09-27 10:28:09
---

After a long time I want to continue to write down stuff I do or think
about. Next time there is a chance it is here.

Also I really like the speed, ease and design of Jekyll and its
beautiful themes[^6] and the free hosting and building on github. And
git is the best version-conrol ever: cloning takes like less time than
copying, merging is BAM and never makes trouble. And I really did use
mercurial, and it seems a bit slow. And SVN more so. And CVS, oh
oh. And RCS (which was super-strange even in 1999)

Today is also the day I decided on how to begin developing react and
there are several applications that just wait to be written.  The
[UI components for Elasticsearch](http://searchkit.co/) are cool!
I tried several boilerplates from this
[Github Search](https://github.com/search?o=desc&q=react+boilerplate&s=stars&type=Repositories&utf8=%E2%9C%93):

* [electron-react-boilerplate](https://github.com/chentsulin/electron-react-boilerplate)
* [react-boilerplate](https://github.com/mxstbr/react-boilerplate)
* [react-slingshot](https://github.com/coryhouse/react-slingshot)

They dont work for me, have much too complex tooling and are broken
because they are older than two weeks. I settled on the sensible `npm
install -g create-react-app` from
like [facebook itself](https://github.com/facebookincubator/create-react-app)
and can recommend it:

> But the Facebook team recognized that as long as there wasn't a
> core-team sanctioned solution, the community was likely to remain
> splintered. ([How to get "create-react-app" to work with your API](https://www.fullstackreact.com/articles/using-create-react-app-with-a-server/))

`webpack` and `babel` are provided with settings from
`react-scripts`. There is no meaningful project set up yet, which
means there is nothing one has to delete. I mean that is right, one
could be programming anything. But it is fully function project with
some cool examples of how webpack magically handles imported svg and
css. And there are some Components, which one can swap to another
syntax.

Reading up on react beginning with an incomplete preview-pdf of
O'Reilly's "Learning React" several links to existing knowlegde come up.

The most controversial part of react has been
[jsx](https://facebook.github.io/react/docs/jsx-in-depth.html), and it
turns out that is just a convenience which is then transpiled to
Reace.createElement()-calls, a way of handling markup that I invented
in 1999. I write most of my markup that way. Why? I hate
interpolation, I hate quotes, I hate mixing strings and variables. I
hate how it looks, I hate how it performs, I hate how it fails, I hate
how it is unsafe. I hate how lots people actually exist writing code
like that, for example SQL, but also XML or HTML. But no question that
was how one wrote stuff in 1999.

For me it began with outputting XML in perl and it was like this. From
the actual archives, shockingly, but it might render some xml. 

``` perl
sub tag_out_open{
    my ( $gi, $att, $ind ) = @_;
    my $tag_out = " " x $ind . "<$gi";
    foreach my $key ( sort keys %$att ){
        $tag_out .= " $key";
        $tag_out .= "='" ;
        $tag_out .= $att->{$key};
        $tag_out .= "'";
    }
    $tag_out .=  ">\n";
    return $tag_out;
}

##
# called like this, I also tried to handle indentation because DOM was
# new and there was  no real Libary for perl. Soon afterwards there
# were perl-bindings for libxml, which could output beautyfied. These
# days I use xmllint for human readable xml
print tag_out_open('test', {'test' => 'test'}');
```

compared with the reincarnation of perls tag_out_open in PHP5:

``` php
$xml->toFull("div", array('class': 'test'), "My Content");
```

later I also used jQuery's a bit:

``` javascript
$('<div>', {}).append("My Content")
```
is almost the same. 

In any case I objected strongly against the new template-language,
because it limits or makes hard what one actually needs to achieve
(rendering html from the content of variables), but it turns out that
while when generating XML then attributes often come from variables as
well (the keys of the dict(), key-value-Dictionaries or hashtables),
xml like this has fieldnames, which would be terrible to put in templates.

``` xml
<book id="12" title="No Logo" /> 
```

On the other hand for HTML the attributes are always known and can be
static strings, and only the values must be interpolated, like src or
title or class. Which is bad enough.

JSX in any case is transpiled to vanilla js:

``` javascript

... render(
<div class=test>MyContent</div>
);

// becomes

React.createElement("div", {className: "test"}, "My Content")

// and React.createElement() render any content, even with a Factory-Method

return React.DOM.ul({className: "things"},
            this.props.items.map((thing, i) =>
                React.createElement("li", { key: i }, ingredient)
            )
        )
```

I really like them for the way rendering of XML-markup: It reminds me
of mine. I guess I can work with that. 

Then there is my favorite word and action in the node
universe. `Transpiling` describes the process to build
browser-readable Vanilla-JS from the hardly recognizable next
generation Javascript `ES6`. I was always wondering about
`Coffeescript` or in deed `Typescript`. Now I know: they are
"transpiled" into vanilla-Javascript as well. `ES6` is transpiled by a
friendly library called `babel` which disappointingly used to be
called `6to5`. And that is what the NodeJS-people used to use `Grunt`
for and now `gulp` and later possibly vanilla `npm`.[^5] Variables in
ES6 might be declared via `var`, `const`, or `let`, where `let`
resembles perl's `my` and is for closures. And Perl is like 100 years
old or s/t. But these strange lambdas I do not like yet:

``` javascript

// short form w/o brackets
var human_string = (firstName, lastName) => `${firstName} ${lastName}`

// or in the long form
var human_string2 = (firstName, lastName) => {
`${firstName} ${lastName}`
}

```

And now I like them:

``` javascript
// simplistic exmples
() => true;
// function ()
() => {};
// function ()
```

But these functions are different:

> Arrow functions do not block off the scope of this.

There is `Destructuring` as well, which comes from Perl and python , at least the
destructuring of Lists. 

``` perl
my ($test) = qw(one two three);
```

The destructuring of Objects is (for me) a bit like PHP's extract(),
which I never ever use. Bit its quite the syntactic sugar in
ES6. It can even be done backwards for creation where the
variable-name is the key: `Object literal enhancement` and works like
this:

``` javascript
{test}
// means 
{test => test}
```

No really my thinking at this point.

But I got my boilerplate, and it works great and there is not sooo
much
[wizard code I don't understand](https://pragprog.com/the-pragmatic-programmer/extracts/wizards). But
seriously

```
justin@tsoff ~/workspace> du -sch pt-react
141M    pt-react
141M    insgesamt
```

141M for an empty clone of hello world seems excessive. But node is
famous for this and I **really** like hot-reload and the actual build
is only 2M. 

In fact `atom` takes like 60 s to load and makes my old Athlon freeze
and [jsx-mode](https://github.com/jsx/jsx-mode.el) is beyond me for
now. And talking of performance this
[Fork of Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes)
takes like an hour to build and the development server takes 10s to
start. I seriously never thought I might say: "Eclipse is a quick and
small app." 

And now: good luck committing this and good luck to github building
it. 










[^5]: There is now even ES7 and they are called "emerging JavaScript" (Oreilly, Learning React, 2016). Oh and i this book they call `Isomorphic Javascript` (same code running on client and server, possibly transpiled for the client, like famoulsly meteor), `Univeral Apps`.



[^6]: Let alone [Octoptress](http://octopress.org), "an obsessively
    designed toolkit". But I rather wanted a plainer, jekyll, which
    unfortunately came without Post-creation-script. Octopress is
    beautiful, i think they say
    [like this one i was just reading](http://aviadas.com/blog/2015/09/06/building-realtime-apps-with-react/)
