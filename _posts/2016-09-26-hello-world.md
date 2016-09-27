---
title: "the first post is the hardest"
---

After a long time I want to continue to write down stuff I do or think about. Next time there is a chance it is here. Also I really like the speed and ease of Git and Github and it might be fun to apply this to hosting.[^4]

Today is also the day I decided on how to begin developing react and there are several application that just wait to be written.[^7] After trying several boilerplates from this [Github Search](https://github.com/search?o=desc&q=react+boilerplate&s=stars&type=Repositories&utf8=%E2%9C%93):

* [electron-react-boilerplate](https://github.com/chentsulin/electron-react-boilerplate)
* [react-boilerplate](https://github.com/mxstbr/react-boilerplate)
* [react-slingshot](https://github.com/coryhouse/react-slingshot)

They all have much too complex tooling.  In the fast-changing universe of node that means: They don't work and are not fixable by me without bleeding from the ears. I finally settled on the sensible `npm install -g create-react-app` from [close to the source](https://github.com/facebookincubator/create-react-app):

> But the Facebook team recognized that as long as there wasn't a core-team sanctioned solution, the community was likely to remain splintered. ([How to get "create-react-app" to work with your API](https://www.fullstackreact.com/articles/using-create-react-app-with-a-server/))

React has another feature that I am quite familiar with, because I invented the "abstraction" in parallel[^8]:


``` javascript
React.createElement("div", {'class': 'test'}, "My Content")
```

compared with my very own

``` php
$xml->toFull("div", array('class': 'test'), "My Content");
```

and jQueryy's

``` javascript
$('<div>', {}).appendChild("My Content")
```
is almost the same. Power through simplicity and reliability. 


<!--
And there there are the beautiful `stateless functional components` which are fun in any language.
-->


And my favorite word and action in the node universe at this point: `Transpiling` which describes the process to build browser-readable Vanilla-JS from the hardly recognizable next generation Javascript `ES6`. I was always wondering about `Coffeescript` or in deed `Typescript`. Now I know: they are "transpiled" into vanilla-Javascript as well. `ES6` is transpiled by a friendly library called `babel` which disappointingly used to be called `6to5`. And that is what the NodeJS-people used to use `Grunt` for and now `gulp` and later possibly vanilla `npm`.[^5] Variables in ES6 might be declared via `var`, `const`, or `let`, where `let` resembles perl's `my` and is for closures. And Perl is like 100 years old or s/t. But these strange lambdas I do not like yet:

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


<!-- 
`Destructuring` comes from Perl as well.

``` perl
my ($test) = qw(one two three);
```
But to do that to Objects is creative and a creative use of implicit introspection. It can even be done backwards where the variable-name is the key: `Object literal enhancement`

-->


So I got my boilerplate, and it works great and there is not so much [wizard code I don't understand](https://pragprog.com/the-pragmatic-programmer/extracts/wizards). But seriously

```
justin@tsoff ~/workspace> du -sch pt-react
141M    pt-react
141M    insgesamt
```

141M for an empty clone of hello world seems excessive. But node is famous for this and I really like hot-reload and the actual build is only 2M. In fact `atom` makes my old Athlon freeze and [jsx-mode](https://github.com/jsx/jsx-mode.el) is beyond me for now. And talking of performance this [Fork of Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes) takes like an hour to build and the development server takes 10s to start. So that is that.

And now: good luck committing this and good luck to github building it. Later I will write about the debate and the meaning of the Donald. we have the same kind of people here in Germany[^6] and the new theory is that there always are 20% jerks, which together with the hillary-haters of another 20% just might get Donald elected.[^2] Another factor in all of this is the slight reality removedness (like my own language removedness) that Americans have always had: For example one of them saw the need to [convert between AM-PM and 24 hour notation](http://www.easysurf.cc/cmtime.htm). Beautiful! Go Donald Go! Rip it down, unfortunately Europe might fall as well.










[^2]: And it is really easy to become a hater of Hillary's hypocricy even if one is no thruther, or birther, or Benghazian. I mean especially as a Democrat, how Bernie Sanders was treated. And what happened to Seth Rich?

[^4]: And I really did use mercurial, and it really does suck. And SVN. And CVS. And RCS (which was super-strange even in 1999)

[^5]: There is now even ES7 and they are called "emerging JavaScript" (Oreilly, Learning React, 2016). Oh and i this book they call `Isomorphic Javascript` (same code running on client and server, possibly transpiled for the client, like famoulsly meteor), `Univeral Apps`.

[^6]: [The New Star of Germany’s Far Right
](http://www.newyorker.com/magazine/2016/10/03/the-new-star-of-germanys-far-right)

[^7]: The [UI components for Elasticsearch](http://searchkit.co/) are cool!

[^8]: mine is actually from 1999, and the original is in perl, I will link it later
